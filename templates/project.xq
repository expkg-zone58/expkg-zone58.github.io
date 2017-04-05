(:~ 
 : html project doc
 :       <description>Parse expressions in XPath or XQuery into XML trees using
 :           REx generated parsers
 :       </description>
 :       <namespace uri="http://expath.org/ns/xparse" />
 :       <repo url=""/> <!-- https://github.com/expkg-zone58/{$name} -->
 :       <local path="C:\Users\andy\workspace\ex-xparse\" />
 :       <doc src="dist\doc\xparse.xqm.xml" />
:)
declare  variable  $project external ;
let $name:=$project/@name/string()
return 
<section id="{$name}">
    <h3>
    <a href="#{$name}">               
    {$name}
     </a>
    </h3>
    <div>{$project/description/(*|text())}</div>
    <div>namespace: {$project/namespace/@uri/string()}</div>
    <div><a href="projects/{$name}.html">Xqdoc</a></div>
    
    <div>repo: <a href="https://github.com/expkg-zone58/{$name}">https://github.com/expkg-zone58/{$name}</a></div>
</section>