import subprocess
import sys

import requests


class ImageTagUpdater:
    def __init__(self, yaml_file_path, new_image_tag):
        self.yaml_file_path = yaml_file_path
        self.new_image_tag = new_image_tag
        self.branch_name = f'update-image-tag-{new_image_tag}'

    def check_docker_image_exists(self):
        try:
            response = requests.get(f'https://hub.docker.com/v2/repositories/girishcodealchemy/alchemy-nginx/tags/{self.new_image_tag}')
            if response.status_code == 200:
                print(f"Docker image girishcodealchemy/alchemy-nginx:{self.new_image_tag} found.")
            else:
                print(f"Docker image girishcodealchemy/alchemy-nginx:{self.new_image_tag} not found.")
                sys.exit(1)
        except requests.RequestException as e:
            print(f"Error checking image: {e}")
            sys.exit(1)

    def update_image_tag(self):
        try:
            # Read the YAML file
            with open(self.yaml_file_path, 'r') as f:
                yaml_content = f.read()

            # Update the image tag
            updated_yaml_content = yaml_content.replace(
                'girishcodealchemy/alchemy-nginx:test',
                f'girishcodealchemy/alchemy-nginx:{self.new_image_tag}'
            )

            # Write the updated content back to the file
            with open(self.yaml_file_path, 'w') as f:
                f.write(updated_yaml_content)

            print(f"Image tag updated to: {self.new_image_tag}")

        except Exception as e:
            print(f"Error updating image tag: {e}")

    def create_or_checkout_branch(self):
        try:
            # Check if branch exists
            subprocess.run(['git', 'rev-parse', '--verify', self.branch_name], check=True, stdout=subprocess.PIPE)
            print(f"Branch {self.branch_name} already exists. Skipping branch creation.")
        except subprocess.CalledProcessError:
            # Create a new branch
            subprocess.run(['git', 'checkout', '-b', self.branch_name])
            print(f"Created and checked out branch: {self.branch_name}")

    def commit_and_push_changes(self):
        try:
            # Commit changes
            subprocess.run(['git', 'add', self.yaml_file_path])
            subprocess.run(['git', 'commit', '-m', f'Update image tag to {self.new_image_tag}'])
            subprocess.run(['git', 'push', '-u', 'origin', self.branch_name])

            print("Changes committed and pushed to the repository")

        except Exception as e:
            print(f"Error committing and pushing changes: {e}")

    def create_pull_request(self, pr_title, pr_body):
        try:
            self.create_or_checkout_branch()
            self.update_image_tag()
            self.commit_and_push_changes()

            # Create a pull request
            subprocess.run(['gh', 'pr', 'create', '--base', 'main', '--head', self.branch_name, '--title', pr_title, '--body', pr_body])

            print(f"Pull request created for branch: {self.branch_name}")

        except Exception as e:
            print(f"Error creating pull request: {e}")

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python script.py <new_image_tag>")
        sys.exit(1)
    new_image_tag = sys.argv[1]
    deployment_yaml_path = 'CloudWebApp/deployment.yml'
    pr_title = f'Update latest WebApp image tag to {new_image_tag}'
    pr_body = 'Updating the image tag in the deployment.yaml file.'

    updater = ImageTagUpdater(deployment_yaml_path, new_image_tag)
    updater.check_docker_image_exists()
    updater.create_pull_request(pr_title, pr_body)
