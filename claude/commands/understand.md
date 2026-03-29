Deeply analyze the current project and produce a structured onboarding guide.

Follow these steps:

1. **Explore the file structure** — list all top-level directories and key files. Look for package.json, README, config files, and entry points.

2. **Read the entry points** — identify the main entry file(s) and read them to understand how the app starts.

3. **Map the architecture** — identify the major layers (UI, API, services, data, config) and which files belong to each.

4. **Trace key flows** — pick the 2-3 most important runtime flows (e.g. the main user action) and trace them through the codebase file by file.

5. **Identify complexity hotspots** — flag the files that are largest, most depended on, or hardest to change safely.

6. **Note the stack** — language, frameworks, databases, external APIs, build tools.

Then produce a comprehensive ONBOARDING.md covering:

- Project overview (purpose, stack, key outputs)
- Recommended reading order
- Architecture layers with key files and notes for each
- Runtime flows step by step
- Key concepts specific to this codebase
- File map with one-line descriptions
- Complexity hotspots
- Common change scenarios
- Local development setup
- First tasks for a new developer
- Known limitations

Save the file as `docs/ONBOARDING.md` (create the `docs/` folder if it doesn't exist).

After saving, ask the user if they'd also like to create a formatted Google Doc version in Drive using the script at `~/Documents/GitHub/datalayer tool/scripts/create-onboarding-doc.mjs` as a reference pattern.
