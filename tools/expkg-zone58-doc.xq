(:~
 : generate html documentation from projects.xml
 : transform xml with xslt generate html for xqdoc for \expkg-zone58.github.io
 :)
import module namespace txq = 'quodatum.txq' at 'txq.xqm';
declare namespace task="https://github.com/Quodatum/app-doc/task";

declare variable $projects-url:="C:\Users\andy\git\expkg-zone58.github.io\projects.xml";

declare variable $destdir external :="C:\Users\andy\git\expkg-zone58.github.io\projects\";
declare variable $mod-xslt external :="C:\Users\andy\git\expkg-zone58.github.io\templates\html-module.xsl";


declare %updating function local:store-html($xml,$dest as xs:string)
{
    file:write($dest,$xml,map{"method": "html","version":"5.0"})
};

declare %updating function local:gen-project-doc($project as xs:string,$xqdoc,$dest)
{
    let $params:=map{
                    "project":$project,
                    "source":"Not available",
                    "cache":true() }
    let $h:=xslt:transform($xqdoc,$mod-xslt,$params)
    return local:store-html($h,$dest)
};


declare %updating function local:gen-index-xq()
{
    let $projects:=doc($projects-url)/projects/project
    let $params:=map{
                       "base":"./",
                       "title":"About expkg-zone58",
                       "projects":fn:sort($projects,(),function($x){$x/@name/lower-case(.)})
                     }
    let $result:=txq:render(fn:resolve-uri("../templates/projects.xq")
                           ,$params
                           ,fn:resolve-uri("../templates/page-wrapper.xq"))
    let $dest:=file:resolve-path( "../index.html",$destdir)
    return local:store-html($result,$dest)
};


(
for $p in doc($projects-url)/projects/project
  let $name:=$p/@name/string()
  let $src:=$p!file:resolve-path(./doc/@src,./local/@path)
  let $dest:=file:resolve-path($name || ".html",$destdir)
  return local:gen-project-doc($name,$src,$dest)
        ,local:gen-index-xq()
        ,db:output("done: " )
)