# Cat Fish

Fish clicking game made in Godot 4. https://d10sfan.itch.io/cat-fish

## Development Information

CI is setup to build artifacts for Linux, Windows, Web, and Android. The game is built with GDScript. Contributions, including code and assets, are welcome! Please look over the pull request template. As well, feature ideas or bugs found are also welcome to be reported.

### Android

A new debug keystore can be created with a command similar to the following

```bash
keytool -keyalg RSA -genkeypair -alias androiddebugkey -keypass android -keystore debug.keystore -storepass android -dname "CN=Android Debug,O=Android,C=US" -validity 9999 -deststoretype pkcs12
```

The keystore can then be converted to base64 and stored in the github secrets.

## License Information

License for the game can be seen here - https://github.com/d10sfan/cat-fish/blob/main/LICENSE.md

For any assets used in the project, see the assets/assets_licenses folder.

