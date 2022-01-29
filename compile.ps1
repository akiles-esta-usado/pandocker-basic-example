<#
Ejecución:

    & ./compile.ps1

Es importante mantener $files actualizado con los nuevos archivos de documentación.
#>

function pandocker {
    docker run --rm -v ${pwd}:/pandoc dalibo/pandocker $args 
}


$files = @(
    "1-introduction.md",
    "2-usage.md",
    "3-math.md",
    "4-code.md",
    "metadata.yml"
);

invoke-expression "pandocker --from $($files -join ' ') -o definitive_test.pdf --from markdown --template eisvogel --listings --number-sections --toc"

