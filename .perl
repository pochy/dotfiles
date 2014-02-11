$ curl -L http://cpanmin.us | perl - --sudo App::cpanminus

export PERL_CPANM_OPT="--local-lib=~/perl5"
export PATH=$HOME/perl5/bin:$PATH;
export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB;

$ cpanm --local-lib=~/perl5 local::lib
