(:~
 : transform xml with xslt generate html for xqdoc for \expkg-zone58.github.io
 :)
declare namespace task="https://github.com/Quodatum/app-doc/task";

declare variable $projects-url:="C:\Users\andy\git\expkg-zone58.github.io\projects.xml";

declare variable $destdir external :="C:\Users\andy\git\expkg-zone58.github.io\projects\";
declare variable $mod-xslt external :="C:\Users\andy\git\expkg-zone58.github.io\tools\html-module.xsl";
declare variable $index-xslt external :="C:\Users\andy\git\expkg-zone58.github.io\tools\index.xsl";

declare %updating function local:gen-project-doc($xqdoc,$dest){
    let $params:=map{"source":"Not available","cache":true() }
    let $h:=xslt:transform($xqdoc,$mod-xslt,$params)
    return file:write($dest,$h,map{"method": "html","version":"5.0"})
};
declare %updating function local:gen-index-doc(){
    let $params:=map{"cache":true() }
    let $h:=xslt:transform($projects-url,$index-xslt,$params)
    let $dest:=file:resolve-path( "index.html",$destdir)
    return file:write($dest,$h,map{"method": "html","version":"5.0"})
};
(
for $p in doc($projects-url)/projects/project
  let $src:=$p!file:resolve-path(./doc/@src,./local/@path)
  let $dest:=file:resolve-path($p/@name || ".html",$destdir)
  return local:gen-project-doc($src,$dest),
  local:gen-index-doc()
  ,db:output("done: " )
)