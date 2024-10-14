---
layout: page
title: CV
permalink: /cv/
toc: true
---

{% assign cv = site.data.cv %}

# {{ cv.data.name }}

- Contact : {{cv.data.email}} \| {{cv.data.location}}
- Socials: {% for s in cv.data.socials %} 
    - [{{ s[0] }}]({{s[1]}}) {% endfor %}

{%for i in cv.data.intro%} 
{{i}}
{% endfor %}

---

## Interests

{% for interest in cv.data.interests %}
- {{interest.headline}} 
{% endfor %}

---

## Projects

Open source projects that I have been involved in, or have been working on:

{% for project in cv.data.projects %}
- {{project.emoji}} [{{project.name}}]({{project.link}}) : {{project.description}} 
{% endfor %}

---

## Previous Experience 

{% for job in cv.jobs %}

### {{ job.company }}: {{job.started}} - {{job.ended}} 
**{{job.role}}** \| {{job.location}}  



Stack: {% for tech in job.stack %} {{ tech }}, {% endfor %}
> {{job.description}}

{% for role in job.roles %}
1. **{{role.name}}** - {{role.description}}
{% endfor %}

{% endfor %}

---

## Education

{% for e in cv.education %}
- {%for i in e %} {{i}} {% endfor %}
{% endfor %}

---

## Awards

{% for a in cv.awards %}
- {%for i in a %} {{i}} {% endfor %}
{% endfor %}