# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Static HTML/CSS portfolio website deployed to AWS using S3 and CloudFront. Built by Ogbonna Nwanneka Mary from Pravin Mishra Template using Agentic AI

There is no build system, package manager, or JavaScript framework — just HTML, CSS, and static assets.

## Deployment


The project is a flat static website with no build system or package manager.
All files sit at the root level and are deployed to AWS S3, served globally 
via CloudFront CDN.

```bash
sudo cp -r /path/to/project/* /var/www/html/
```

Accessible at: `http://<public-ip>`

## Architecture

- `index.html` — Main homepage (entry point)
- `privacy.html` — Privacy policy page
- `terms.html` — Terms and conditions page
- `style.css` — Single global stylesheet shared across all pages
- `images/` — All image assets (logos, photos, icons)
- `skills/` — Assets and content related to the skills section
- `README.md` — Project documentation and student instructions
- `CLAUDE.md` — Claude Code guidance file for AI-assisted development

Font Awesome 6.5.0 is loaded via CDN. No JavaScript files exist; any JS-dependent features (e.g., `id="year"` in the footer, `toggleMenu()`, `goToSection()`) are currently non-functional stubs.

## DMI Student Requirement

Students **must** edit the footer in `index.html` before deployment to add ownership proof:

```html
<p><strong>Deployed by:</strong> DMI Cohort 2 | Your Name | Group X | Week 1 | DD-MM-YYYY</p>
```

This line must be visible in the browser screenshot submitted as proof of deployment.

## Conventions
No JavaScript allowed in the project

Mobile-first CSS approach

All images stored in images/