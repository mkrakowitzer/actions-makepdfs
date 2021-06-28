# A github action for creating PDFs from github markdown

This action creates PDF documents from github markdown

## Inputs

### `markdown_dir`

**Required** Location of markdown files in github repository. Default `doc`.

### `output_dir`

**Required** Location to output PDF files to. Default `tmp`.

### `media_dir`

**Optional** Location where media files such as images and gifs which are 
embedded in Markdown files are stored. Default to `doc/img` Keep in mind 
that all media files need to be referenced in markdown files as follows: 
`[Alt Text](http://localhost:3000/image_name.jpg)`. 

This is due to security features in puppeteer which prevent referencing 
local images embedded in HTML.

## Example usage

```
on:
  push:
    paths:
      - 'doc/**'

name: CreatePDFs

jobs:
  makepdfs:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: mkrakowitzer/actions-makepdfs@master
      if: github.ref == 'refs/heads/master'
      with:
        markdown_dir: doc
        output_dir: tmp
    - uses: actions/upload-artifact@v1
      with:
        name: platform-architecture-docs
        path: tmp
```
