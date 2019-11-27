# A github action for creating PDFs from github markdown

This action creates PDF documents from github markdown

## Inputs

### `markdown_dir`

**Required** Location of markdown files in github repository. Default `doc`.

### `output_dir`

**Required** Location to output PDF files to. Default `tmp`.

## Example usage

```
on: [push]

name: CreatePDFs

jobs:
  makepdfs:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: mkrakowitzer/actions-makepdfs@master
      if: github.ref == 'refs/heads/master'
    - uses: actions/upload-artifact@v1
      with:
        name: platform-architecture-docs
        path: tmp
```
