Skill Name: /deploy

Description: Deploys the static HTML/CSS portfolio website to AWS S3 and invalidates the CloudFront cache so the latest version is served globally.

Allowed Tools: Bash, file read, AWS CLI

Model Invocation Disabled: No

Body Instructions:
1. Check that all required files exist — index.html, style.css, and the images/ folder — before starting the deployment
2. Sync all project files to the S3 bucket using the AWS CLI, overwriting any existing files
3. Confirm the S3 sync was successful before moving to the next step
4. Invalidate the CloudFront distribution cache so users receive the latest version of the site immediately
5. Output a final confirmation message with the CloudFront URL so the student can verify the live deployment in their browser
