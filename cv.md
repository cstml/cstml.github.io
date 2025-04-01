---
layout: page
title: CV
permalink: /cv/
toc: true
---

{% assign cv = site.data.info %}
{% assign projects = cv.data.projects %}
{% assign socials = cv.data.socials %}
{% assign jobs = cv.data.jobs %}
{% assign projects = cv.data.projects %}
{% assign degrees = cv.data.degrees %}
{% assign awards = cv.data.awards %}



# {{ cv.data.name }}

- Contact : {{cv.data.email}} \| {{cv.data.location}}

- Socials: 
{% for s in socials %} 
  - [{{ s.name }}]({{s.link}}) 
{% endfor %}

{{ cv.data.intro }}

---

## Interests

{% for interest in cv.data.interests %}
- {{interest}} 
{% endfor %}

---

## Projects
Open source projects that I have been involved in, or have been working on:

{% for project in projects %}
- {{project.emoji}} [{{project.name}}]({{project.link}}) : {{project.description}} 
{% endfor %}

---

## Previous Experience 

{% for job in jobs %}

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

{% for degree in degrees %}
- {{degree.degree}} - {{degree.specialisation}} - {{degree.location}} 
  - {{degree.from}} - {{degree.to}}
{% endfor %}

---

## Awards

{% for award in awards %}
- {{award.emoji}} {{award.title}} - {{award.description}}
{% endfor %}