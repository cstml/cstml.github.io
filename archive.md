---
layout: page 
title: Archive
permalink: /archive/
---

# Tags

{%- assign default_paths = site.pages | map: "path" -%}
{%- assign page_paths = site.header_pages | default: default_paths -%}

{%- if page_paths -%}

    {%- for path in page_paths -%}
        {%- assign my_page = site.pages | where: "path", path | first -%}
        {%- if my_page.title and my_page.type == "tag" -%}   
: 
[{{my_page.title}}]({{my_page.url}})
:
        {%- endif -%}
    {%- endfor -%}
{%- endif -%}