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
declare namespace pkg="http://expath.org/ns/pkg";
declare namespace cxan="http://cxan.org/ns/package";

declare  variable  $project external ;

let $name:=$project/@name/string()
let $pkg:=doc($project/local/@path || "src/main/expath-pkg.xml")/pkg:package
let $cxan-path:=$project/local/@path || "src/main/cxan.xml" 
let $cxan:=if(doc-available($cxan-path)) then
                doc($cxan-path)/cxan:package
           else 
                ()
let $tags:=$cxan/cxan:tag/string()
return 
<section id="{$name}">
    <h3>
    <a href="#{$name}">               
    {$name}
     </a>
     <span class="namespace" title="Namespace">{$pkg/pkg:xquery/pkg:namespace/text()}</span>
    </h3>
    <dl>
    <dt class="label">Summary</dt>
    <dd>{$pkg/pkg:title/(*|text())}</dd>

    <dt class="label">Documentation</dt>
    <dd><a href="projects/{$name}.html">xqDoc</a>, Tags: {$tags}</dd> 
    
    <dt class="label">Repository</dt>
    <dd><a href="https://github.com/expkg-zone58/{$name}" target="dlink">https://github.com/expkg-zone58/{$name}</a></dd> 
  
    </dl>
   </section>