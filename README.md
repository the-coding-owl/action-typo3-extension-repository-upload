# TYPO3 Extension Repository (TER) upload action

This action is handling an upload to the TYPO3 Extension Repository.
It uses the [helhum/ter-client](https://github.com/helhum/ter-client) internally to do the upload.

## Environment Variables

### SECRET_USERNAME
**Required** The username of the user account, that is allowed to upload the extension (Add via github secrets)

### SECRET_PASSWORD
**Required** The password of the user account, that is allowed to upload the extension (Add via github secrets)

### EXTENSION_KEY
**Required** The extension key

### UPLOAD_MESSAGE
**Required** The message for the extension upload

## Example Usage
Use this action in your workflow like this:

```yaml
uses: the-coding-owl/action-typo3-extension-repository-upload@0.0.1
  env: 
    SECRET_USERNAME: ${{ secrets.USERNAME }}
    SECRET_PASSWORD: ${{ secrets.PASSWORD }}
    EXTENSION_KEY: 'github_actions_test'
    UPLOAD_MESSAGE: ${{ github.event.release.body }}
```