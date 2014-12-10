vim
===

**安装之前，请备份自己的vim配置，以防不时之需，切记。**

<h1>自动安装</h1>
直接运行一下命令则可
<pre>
curl -L http://git.io/2wHY3w | bash
</pre>

<h1>手动安装</h1>
备份旧配置
<pre>
mv ~/.vim ~/.vim.bak.liuyb
mv ~/.vimrc ~/.vimrc.bak.liuyb
</pre>
<pre>
git clone https://github.com/liuyb/vim ~/.vim
</pre>
<p>创建~/.vim/vimrc 到 ~/.vimrc 的软连接</p>
<pre>
ln -s ~/.vim/vimrc ~/.vimrc
</pre>
至此安装完成了，直接运行vim即可安装其他插件了


<h1>利用Vundle管理Vim插件</h1>
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
