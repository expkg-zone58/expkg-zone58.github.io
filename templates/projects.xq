(:~
 : generate HTML index page for all projects
 :)
declare   variable  $projects external ;
declare   variable  $partial external ;
<div>
<h1>Introduction</h1>
<div>
<code>
<a href="https://github.com/expkg-zone58" target="dlink">expkg-zone58</a>
</code> is a collection of XQuery library modules targeted at 
<a href="http://basex.org"  target="dlink">BaseX</a> 
and  packaged using EXPath package format 
<a href="http://expath.org/spec/pkg"  target="dlink">http://expath.org/spec/pkg</a>.

Often these are wrappers to third party open-source Java libraries.

</div>
<nav id="toc">
           
            <h2>
                <a id="contents"></a>
                Table of Contents
            </h2>
            <ol class="toc">
                <li>
                    <a href="#main">
                        <span class="secno">1 </span>
                        <span class="content">Introduction</span>
                    </a>
                </li>
                
                <li>
                    <ol class="toc">
                        <li>
                            <a href="#projects">
                                <span class="secno">2 </span>
                                <span class="content">Projects</span>
                            </a>
                            <ol class="toc">
                                {for $project at $pos in $projects
                                  
                                    let $id:=$project/@name/string() 
                                    return <li>
                                        <a href="#{$id}">
                                            <span class="secno">2.{$pos}</span>
                                            <span class="content">
                                                {$id}
                                            </span>
                                        </a>
                                    </li>
                                }
                            </ol>
                        </li>
                    </ol>
                </li>

            </ol>
        </nav>
<h2>Projects</h2>
 {$partial("project.xq","project",$projects )}

</div>