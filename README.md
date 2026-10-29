# CipherNote PWA

CipherNote is a static web app. It keeps the existing single-file UI and encrypted local vault, and adds a standard web app manifest, local app icons, and an external service worker so installation and offline app-shell caching can work on HTTPS hosting.

## Publish for free with GitHub Pages

1. Sign in to GitHub and create a **new public repository** named `ciphernote`.
2. Upload the contents of this folder to the repository root. Ensure `index.html`, `manifest.json`, `service-worker.js`, and `icons/` are at the root/top level as shown here.
3. Open the repository's **Settings → Pages**.
4. Under **Build and deployment**, select **Deploy from a branch**, choose `main` and `/ (root)`, then save.
5. Wait for the Pages deployment to finish. GitHub will show the site's URL in Settings → Pages.
6. Open that HTTPS URL on Android in Chrome. Use the browser menu and choose **Install app** or **Add to Home screen**.

Official instructions: https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site

## Important privacy and functionality notes

- The existing vault uses Web Crypto (PBKDF2 + AES-GCM) and stores the encrypted vault and salt in browser `localStorage`. Publishing this static site does **not** upload or sync notes to a server. Notes remain local to each browser/device. Keep a backup; clearing browser storage can remove the local vault.
- Do not put private notes, passcodes, or backup files in the public source repository. Only the app's code/assets should be uploaded.
- The app's AI action currently contains an empty API key in the original source, so AI processing will not work until it is integrated safely through a backend. Do not place a private API key in public frontend code.
- The app loads styling and helper libraries from third-party CDNs. Those libraries need to be downloaded once for best-effort offline use; complete offline behavior depends on whether those resources were successfully cached.
- A service worker requires HTTPS (or localhost). It will not register when opened as a local `file://` file.
