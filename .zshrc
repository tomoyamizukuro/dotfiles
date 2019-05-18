# zplug settings
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# plugins
zplug "zsh-users/zsh-autosuggestions"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
      printf "Install? [y/N]: "
          if read -q; then
                    echo; zplug install
                        fi
                        fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
f [[ -z "$TMUX" ]] && [[ -z "$STY" ]]
then

  # tmux $B$,5/F0$7$F$$$J$1$l$P5/F0$7$^$9!#(B
    # tmux $B$r5/F0$7$?>l9g$O(B tmux.rc.zsh $B$NCf$G(B exit $B$r8F$V$N$G!"$3$N%3!<%I%V%m%C%/$N30B&$O<B9T$5$l$^$;$s!#(B
      . "${HOME}/.zsh/rc/exports.rc.zsh"
        . "${HOME}/.zsh/rc/tmux.rc.zsh"
        fi

        zmodload zsh/zpty

# anyenv $B$,%3%^%s%I$H$7$F<B9T2DG=$G$"$l$P(B anyenv $B$r=i4|2=$7$^$9!#(B
if [[ "${+commands[anyenv]}" == 1 ]]
  then
    eval "$(anyenv init - zsh)"
    fi

    autoload -Uz compinit

# zplugin $B$r%m!<%I$7$^$9!#(B
. "${HOME}/.zplugin/bin/zplugin.zsh"

# zplugin $B$N%3%^%s%IJd40$r%m!<%I$7$^$9!#(B
autoload -Uz _zplugin

# $B%W%i%0%$%s$,;H$&%3%^%s%I$r$3$N%?%$%_%s%0$G(B autoload $B$7$F$*$-$^$9!#(B
autoload -Uz add-zsh-hook
autoload -Uz cdr
autoload -Uz chpwd_recent_dirs

if [[ "${+_comps}" == 1 ]]
  then
    _comps[zplugin]=_zplugin
    fi

# zplugin: Utilities {{{
# OS$B4V$N%/%j%C%W%\!<%I$N:90[$r5[<}$9$k%3%^%s%I$rDj5A$9$k(B oh-my-zsh $B$N%9%K%Z%C%H$r%m!<%I$7$^$9!#(B
zplugin snippet 'OMZ::lib/clipboard.zsh'
zplugin snippet "${HOME}/.zsh/rc/10_utilities.zsh"

# ($B>JN,(B)
# fzf $B$rMxMQ$7$?Jd40$N%-!<%P%$%s%I$r@_Dj$9$k%9%K%Z%C%H$r%m!<%I$7$^$9!#(B
# Homebrew $B$G(B fzf $B$,%$%s%9%H!<%k$5$l$F$$$k!"$+$D(B HOMEBREW_PREFIX $B$K(B Homebrew $B$N%W%j%U%#%C%/%9$,3JG<$5$l$F$$$k$3$H$,A0Ds$G$9!#(B
zplugin snippet "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
# $B<+J,$N%-!<%P%$%s%I@_Dj$r$3$3$GFI$_9~$_$^$9!#(B
zplugin snippet "${HOME}/.zsh/rc/20_key-bindings.zsh"

# $B<+J,$N%(%$%j%"%9@_Dj$r$3$3$GFI$_9~$_$^$9!#(B
zplugin snippet "${HOME}/.zsh/rc/30_aliases.zsh"

# zsh $B$NJd40$r;H$$$d$9$/@_Dj$9$k(B oh-my-zsh $B$N%9%K%Z%C%H$r%m!<%I$7$^$9!#(B
zplugin snippet 'OMZ::lib/completion.zsh'
zplugin snippet 'OMZ::lib/compfix.zsh'
# ($B>JN,(B)
# $B<+J,$N(B zsh $B%*%W%7%g%s@_Dj$r$3$3$GFI$_9~$_$^$9!#(B
zplugin snippet "${HOME}/.zsh/rc/50_options.zsh"

# $B%W%i%0%$%s$N@_Dj$J$I$r$3$3$GFI$_9~$_$^$9!#(B
zplugin snippet "${HOME}/.zsh/rc/70_misc.zsh"

# $B<+J,$N%3%^%s%IDj5A$J$I$r$3$3$GFI$_9~$_$^$9!#(B
zplugin snippet "${HOME}/.zsh/rc/80_custom.zsh"
# }}}

# zplugin: Plugins {{{

# djui/alias-tips {{{
export ZSH_PLUGINS_ALIAS_TIPS_TEXT='alias-tips: '
# }}}

# fzf $B$G3(J8;z$r8!:w(B&$BF~NO$?$a$N%W%i%0%$%s$G$9!#(B
zplugin light 'b4b4r07/emoji-cli'
# $BMxMQ2DG=$J%(%$%j%"%9$r;H$o$:$K%3%^%s%I$r<B9T$7$?:]$KDLCN$9$k%W%i%0%$%s$G$9!#(B
zplugin light 'djui/alias-tips'
# fzf $B$r;H$C$?%&%#%8%'%C%H$,J#?t%P%s%I%k$5$l$?%W%i%0%$%s$G$9!#(B
zplugin light 'mollifier/anyframe'
# $B:n6HCf$N(BGit$B$N%k!<%H%G%#%l%/%H%j$^$G%8%c%s%W$9$k%3%^%s%I$rDj5A$9$k%W%i%0%$%s$G$9!#(B
# cd-gitroot $B%3%^%s%I$r%(%$%j%"%9$G(B U $B$K3d$jEv$F$F$$$^$9!#(B
zplugin light 'mollifier/cd-gitroot'
# tmux $B$N%&%#%s%I%&$r:n6HCf$N(BGit$B%l%]%8%H%jL>$K1~$8$F<+F0E*$K%j%M!<%`$7$F$/$l$k%W%i%0%$%s$G$9!#(B($B<+J,$G:n$C$?(B)
zplugin light 'sei40kr/zsh-tmux-rename'
# ls $B$h$j$b;H$$$d$9$/8+$d$9$$%G%#%l%/%H%j$N0lMwI=<($N%3%^%s%I$rDj5A$9$k%W%i%0%$%s$G$9!#(B
zplugin ice pick'k.sh'
zplugin light 'supercrabtree/k'

# $B:n6H%G%#%l%/%H%j$K(B .env $B%U%!%$%k$,$"$C$?>l9g$K<+F0E*$K%m!<%I$7$F$/$l$^$9!#(B
zplugin snippet 'OMZ::plugins/dotenv/dotenv.plugin.zsh'
# $B%3%^%s%IF~NOBT$A>uBV$+$i(B control-Z $B$G(B suspend $B$7$?%W%m%;%9$KI|5"$9$k%-!<%P%$%s%I$r@_Dj$9$k%W%i%0%$%s$G$9!#(B
zplugin snippet 'OMZ::plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh'
# Git$B$NJd40$HBgNL$N%(%$%j%"%9$rDj5A$9$k%W%i%0%$%s$G$9!#(B
# $B%(%$%j%"%9$O=EJu$9$k$b$N$,B?$/!"(BGit$B$r;H$&%f!<%6!<$K$OI,$:%*%9%9%a$7$?$$%W%i%0%$%s$G$9!#(B
zplugin snippet 'OMZ::plugins/git/git.plugin.zsh'
# GitHub $B$N%l%]%8%H%j$r4IM}$9$k$?$a$N%3%^%s%I$rDj5A$9$k%W%i%0%$%s$G$9!#(B
zplugin snippet 'OMZ::plugins/github/github.plugin.zsh'
# $BHs(BGNU$B7O(BOS$B$K%$%s%9%H!<%k$7$?(BGNU$B7O%D!<%k$r%W%j%U%#%C%/%9$J$7$G;H$($k$h$&$K$9$k%W%i%0%$%s$G$9!#(B
zplugin snippet 'OMZ::plugins/gnu-utils/gnu-utils.plugin.zsh'
# .zshrc $B$r(B zcompile $B$7$F%m!<%I$7$F$/$l$k(B src $B%3%^%s%I$rDj5A$9$k%W%i%0%$%s$G$9!#(B
zplugin snippet 'OMZ::plugins/zsh_reload/zsh_reload.plugin.zsh'
# }}}

# zplugin: Commands {{{
# Go $B$G=q$+$l$?%D!<%k72$rJBNs%@%&%s%m!<%I(B&$B%S%k%I(B&$B%$%s%9%H!<%k$7$F$/$l$^$9!#(B
zplugin ice from'gh-r' as'command' mv'gotcha_* -> gotcha'
zplugin light 'b4b4r07/gotcha'

# ($B>JN,(B)

# mosh $B$d(B ssh $B$G%j%b!<%H$N%7%'%k$K<+J,$N(B rc $B%U%!%$%k$r%m!<%I$7$^$9!#(B
zplugin snippet --command \
    'https://raw.githubusercontent.com/Russell91/sshrc/master/moshrc'
    zplugin snippet --command \
        'https://raw.githubusercontent.com/Russell91/sshrc/master/sshrc'
# git diif $B$d(B tig $B$N2DFI@-$r$h$jNI$/$7$^$9!#(B($BMW@_Dj(B)
# Homebrew $B$G(B git $B$r%$%s%9%H!<%k$7$F$$$k$3$H!"(B `HOMEBREW_PREFIX` $B$K(B Homebrew $B$N%W%j%U%#%C%/%9$,3JG<$5$l$F$$$kA0Ds$G$9!#(B
        zplugin snippet --command \
            "${HOMEBREW_PREFIX}/share/git-core/contrib/diff-highlight/diff-highlight"
# }}}

# zplugin: Completions {{{
# $B%W%i%0%$%s$NCf$K4^$^$l$F$$$k%3%^%s%IJd40$N$_$r(B zplugin $B$G4IM}$7$^$9!#(B
# $BA[Dj$5$l$?(B zplugin $B$N;H$$J}$G$O$J$$$+$b$7$l$^$;$s!#(B
zplugin ice pick''
zplugin light 'jsforce/jsforce-zsh-completions'
zplugin ice pick''
zplugin light 'zsh-users/zsh-completions'
# }}}

compinit
zplugin cdreplay -q

# zplugin: Plugins loaded after compinit {{{
# $B%3%^%s%I$r%O%$%i%$%H$9$k%W%i%0%$%s$rCY1d%m!<%I$7$^$9!#(B
zplugin ice wait'1' atload'_zsh_highlight'
zplugin light 'zdharma/fast-syntax-highlighting'
# $B%3%^%s%I$r%5%8%'%9%H$9$k%W%i%0%$%s$rCY1d%m!<%I$7$^$9!#(B
zplugin ice wait'1' atload'_zsh_autosuggest_start'
zplugin light 'zsh-users/zsh-autosuggestions'

# $B%W%m%s%W%H$N%F!<%^$rCY1d%m!<%I$7$^$9!#$3$N%W%i%0%$%s$N$_%m!<%I40N;8e$K%W%m%s%W%H$r:FIA2h$7$F$$$^$9!#(B
zplugin ice pick'spaceship.zsh' wait'!0'
zplugin light 'denysdovhan/spaceship-zsh-theme'
# }}}
