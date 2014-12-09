vim
===

<h1>利用Vundle管理Vim插件</h1>
<p>创建~/.vim/vimrc 到 ~/.vimrc 的软连接</p>
<pre>
ln -s ~/.vim/vimrc ~/.vimrc
</pre>
<p>最开始在.vimrc加入如下代码，启动Vim的时候，就会自动去检查Vundle是否已经安装，若找不到Vundle则先自动安装好Vundle。</p>
<pre>
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
</pre>

插件加入Vundle自己，插件实现自管理。
<pre>Bundle 'gmarik/vundle'</pre>

至此可以用Vundle管理插件了。.gitignore加入bundle/，这样git就不会将插件那堆目录上传到github了，精简，呵呵

<pre>
bundle/
</pre>

其他配置看个人喜好，enjoy！
