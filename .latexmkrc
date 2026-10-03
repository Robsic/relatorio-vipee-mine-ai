$pdf_mode = 5;
$postscript_mode = $dvi_mode = 0;
@default_files = ('0_relatorio_vipee.tex');

$xelatex = 'xelatex -interaction=nonstopmode -synctex=1 -halt-on-error %O %S';

$clean_ext = 'bbl bcf blg fdb_latexmk fls glg glo gls idx ilg ind ist lof log lol loquadro lot out run.xml toc synctex.gz';

use File::Find;
END {
    # Remove iterativamente arquivos intermediários que sobraram de compilações
    # locais parciais ou arquivos \input quando rodar latexmk -c ou -C
    if ($cleanup_mode > 0) {
        my @exts = qw(aux bbl bcf blg fdb_latexmk fls glg glo gls idx ilg ind ist lof log lol loquadro lot out run.xml toc synctex.gz xdv);
        my %ext_map = map { $_ => 1 } @exts;
        find(sub {
            if (-f $_ && /\.([^.]+(?:\.gz)?)$/ && $ext_map{$1} || /\.([^.]+)$/ && $ext_map{$1}) {
                unlink $_;
            }
        }, '.');
    }
}
