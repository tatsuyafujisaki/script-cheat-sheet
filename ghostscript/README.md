# How to add page numbers to a PDF
1. Download `add-page-numbers.ps`
1. Run the following:
    ```shell
    brew install ghostscript
    gs -dBATCH -sDEVICE=pdfwrite -dNOPAUSE -q -sOutputFile=output.pdf add-page-numbers.ps input.pdf
    ```
