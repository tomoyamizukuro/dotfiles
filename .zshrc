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

  # tmux が起動していなければ起動します。
    # tmux を起動した場合は tmux.rc.zsh の中で exit を呼ぶので、このコードブロックの外側は実行されません。
      . "${HOME}/.zsh/rc/exports.rc.zsh"
        . "${HOME}/.zsh/rc/tmux.rc.zsh"
        fi

        zmodload zsh/zpty

# anyenv がコマンドとして実行可能であれば anyenv を初期化します。
if [[ "${+commands[anyenv]}" == 1 ]]
  then
    eval "$(anyenv init - zsh)"
    fi

    autoload -Uz compinit

# zplugin をロードします。
. "${HOME}/.zplugin/bin/zplugin.zsh"

# zplugin のコマンド補完をロードします。
autoload -Uz _zplugin

# プラグインが使うコマンドをこのタイミングで autoload しておきます。
autoload -Uz add-zsh-hook
autoload -Uz cdr
autoload -Uz chpwd_recent_dirs

if [[ "${+_comps}" == 1 ]]
  then
    _comps[zplugin]=_zplugin
    fi

# zplugin: Utilities {{{
# OS間のクリップボードの差異を吸収するコマンドを定義する oh-my-zsh のスニペットをロードします。
zplugin snippet 'OMZ::lib/clipboard.zsh'
zplugin snippet "${HOME}/.zsh/rc/10_utilities.zsh"

# (省略)
# fzf を利用した補完のキーバインドを設定するスニペットをロードします。
# Homebrew で fzf がインストールされている、かつ HOMEBREW_PREFIX に Homebrew のプリフィックスが格納されていることが前提です。
zplugin snippet "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
# 自分のキーバインド設定をここで読み込みます。
zplugin snippet "${HOME}/.zsh/rc/20_key-bindings.zsh"

# 自分のエイリアス設定をここで読み込みます。
zplugin snippet "${HOME}/.zsh/rc/30_aliases.zsh"

# zsh の補完を使いやすく設定する oh-my-zsh のスニペットをロードします。
zplugin snippet 'OMZ::lib/completion.zsh'
zplugin snippet 'OMZ::lib/compfix.zsh'
# (省略)
# 自分の zsh オプション設定をここで読み込みます。
zplugin snippet "${HOME}/.zsh/rc/50_options.zsh"

# プラグインの設定などをここで読み込みます。
zplugin snippet "${HOME}/.zsh/rc/70_misc.zsh"

# 自分のコマンド定義などをここで読み込みます。
zplugin snippet "${HOME}/.zsh/rc/80_custom.zsh"
# }}}

# zplugin: Plugins {{{

# djui/alias-tips {{{
export ZSH_PLUGINS_ALIAS_TIPS_TEXT='alias-tips: '
# }}}

# fzf で絵文字を検索&入力ためのプラグインです。
zplugin light 'b4b4r07/emoji-cli'
# 利用可能なエイリアスを使わずにコマンドを実行した際に通知するプラグインです。
zplugin light 'djui/alias-tips'
# fzf を使ったウィジェットが複数バンドルされたプラグインです。
zplugin light 'mollifier/anyframe'
# 作業中のGitのルートディレクトリまでジャンプするコマンドを定義するプラグインです。
# cd-gitroot コマンドをエイリアスで U に割り当てています。
zplugin light 'mollifier/cd-gitroot'
# tmux のウィンドウを作業中のGitレポジトリ名に応じて自動的にリネームしてくれるプラグインです。(自分で作った)
zplugin light 'sei40kr/zsh-tmux-rename'
# ls よりも使いやすく見やすいディレクトリの一覧表示のコマンドを定義するプラグインです。
zplugin ice pick'k.sh'
zplugin light 'supercrabtree/k'

# 作業ディレクトリに .env ファイルがあった場合に自動的にロードしてくれます。
zplugin snippet 'OMZ::plugins/dotenv/dotenv.plugin.zsh'
# コマンド入力待ち状態から control-Z で suspend したプロセスに復帰するキーバインドを設定するプラグインです。
zplugin snippet 'OMZ::plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh'
# Gitの補完と大量のエイリアスを定義するプラグインです。
# エイリアスは重宝するものが多く、Gitを使うユーザーには必ずオススメしたいプラグインです。
zplugin snippet 'OMZ::plugins/git/git.plugin.zsh'
# GitHub のレポジトリを管理するためのコマンドを定義するプラグインです。
zplugin snippet 'OMZ::plugins/github/github.plugin.zsh'
# 非GNU系OSにインストールしたGNU系ツールをプリフィックスなしで使えるようにするプラグインです。
zplugin snippet 'OMZ::plugins/gnu-utils/gnu-utils.plugin.zsh'
# .zshrc を zcompile してロードしてくれる src コマンドを定義するプラグインです。
zplugin snippet 'OMZ::plugins/zsh_reload/zsh_reload.plugin.zsh'
# }}}

# zplugin: Commands {{{
# Go で書かれたツール群を並列ダウンロード&ビルド&インストールしてくれます。
zplugin ice from'gh-r' as'command' mv'gotcha_* -> gotcha'
zplugin light 'b4b4r07/gotcha'

# (省略)

# mosh や ssh でリモートのシェルに自分の rc ファイルをロードします。
zplugin snippet --command \
    'https://raw.githubusercontent.com/Russell91/sshrc/master/moshrc'
    zplugin snippet --command \
        'https://raw.githubusercontent.com/Russell91/sshrc/master/sshrc'
# git diif や tig の可読性をより良くします。(要設定)
# Homebrew で git をインストールしていること、 `HOMEBREW_PREFIX` に Homebrew のプリフィックスが格納されている前提です。
        zplugin snippet --command \
            "${HOMEBREW_PREFIX}/share/git-core/contrib/diff-highlight/diff-highlight"
# }}}

# zplugin: Completions {{{
# プラグインの中に含まれているコマンド補完のみを zplugin で管理します。
# 想定された zplugin の使い方ではないかもしれません。
zplugin ice pick''
zplugin light 'jsforce/jsforce-zsh-completions'
zplugin ice pick''
zplugin light 'zsh-users/zsh-completions'
# }}}

compinit
zplugin cdreplay -q

# zplugin: Plugins loaded after compinit {{{
# コマンドをハイライトするプラグインを遅延ロードします。
zplugin ice wait'1' atload'_zsh_highlight'
zplugin light 'zdharma/fast-syntax-highlighting'
# コマンドをサジェストするプラグインを遅延ロードします。
zplugin ice wait'1' atload'_zsh_autosuggest_start'
zplugin light 'zsh-users/zsh-autosuggestions'

# プロンプトのテーマを遅延ロードします。このプラグインのみロード完了後にプロンプトを再描画しています。
zplugin ice pick'spaceship.zsh' wait'!0'
zplugin light 'denysdovhan/spaceship-zsh-theme'
# }}}
