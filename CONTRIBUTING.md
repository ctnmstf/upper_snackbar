# Contributing to Upper Snackbar

First off, thank you for considering contributing to Upper Snackbar! It's people like you that make Upper Snackbar such a great tool.

## Code of Conduct

This project and everyone participating in it is governed by our commitment to providing a welcoming and inspiring community for all.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the issue list as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

* **Use a clear and descriptive title** for the issue to identify the problem.
* **Describe the exact steps which reproduce the problem** in as many details as possible.
* **Provide specific examples to demonstrate the steps**.
* **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
* **Explain which behavior you expected to see instead and why.**
* **Include screenshots and animated GIFs** which show you following the described steps and clearly demonstrate the problem.
* **Include your Flutter version**, Dart version, and the version of the package you're using.

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When you are creating an enhancement suggestion, please include:

* **Use a clear and descriptive title** for the issue to identify the suggestion.
* **Provide a step-by-step description of the suggested enhancement** in as many details as possible.
* **Provide specific examples to demonstrate the steps** or provide code snippets which you want to see supported.
* **Describe the current behavior** and **explain which behavior you expected to see instead** and why.
* **Explain why this enhancement would be useful** to most Upper Snackbar users.

### Pull Requests

* Fill in the required template
* Do not include issue numbers in the PR title
* Follow the Dart/Flutter style guide
* Include thoughtfully-worded, well-structured tests
* Document new code
* End all files with a newline

## Development Process

1. **Fork the repository** and create your branch from `main`.

```bash
git checkout -b feature/amazing-feature
```

2. **Make your changes** and ensure the code follows the project's style guidelines.

3. **Add tests** for your changes (if applicable).

4. **Run the tests** to ensure everything passes:

```bash
flutter test
```

5. **Run the analyzer** to check for any issues:

```bash
flutter analyze
```

6. **Format your code**:

```bash
dart format .
```

7. **Commit your changes** using a descriptive commit message:

```bash
git commit -m "feat: add amazing feature"
```

8. **Push to your fork**:

```bash
git push origin feature/amazing-feature
```

9. **Submit a pull request** to the `main` branch.

## Commit Message Guidelines

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

* `feat:` - A new feature
* `fix:` - A bug fix
* `docs:` - Documentation only changes
* `style:` - Changes that do not affect the meaning of the code
* `refactor:` - A code change that neither fixes a bug nor adds a feature
* `perf:` - A code change that improves performance
* `test:` - Adding missing tests or correcting existing tests
* `chore:` - Changes to the build process or auxiliary tools

Examples:
```
feat: add gradient background support
fix: resolve animation timing issue
docs: update README with new examples
```

## Style Guidelines

### Dart Style Guide

* Follow the official [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
* Use `dart format` to format your code
* Keep lines under 80 characters when possible
* Use meaningful variable and function names
* Add comments for complex logic
* Document all public APIs

### Documentation

* Use `///` for documentation comments
* Document all public classes, methods, and properties
* Include examples in documentation when helpful
* Keep documentation up to date with code changes

## Testing

* Write tests for new features
* Ensure all tests pass before submitting PR
* Aim for high code coverage
* Test edge cases

Run tests:
```bash
flutter test
```

## Project Structure

```
upper_snackbar/
├── lib/
│   └── upper_snackbar.dart    # Main package file
├── example/
│   └── lib/
│       └── main.dart           # Example app
├── test/
│   └── upper_snackbar_test.dart # Tests
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE
├── pubspec.yaml
└── README.md
```

## Questions?

Feel free to open an issue with your question or reach out to the maintainers.

## Recognition

Contributors will be recognized in the project's README and release notes.

Thank you for your contributions! 🎉

