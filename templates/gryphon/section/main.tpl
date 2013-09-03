{# gryphon/section/main.tpl #}

{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ section.name }}{% endblock %}

{% block activeNav %}{{ active }}{% endblock %}
{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ config.get('gryphon:publication:name') }} :: {{ section.name }}" href="{{ (section.url~'.xml')|url }}" />
<link rel="stylesheet" type="text/css" href="tdg/assets/src/css/bootstrap/carousel.less"/>
<link rel="javascript" href="tdg/assets/src/js/vendor/bootstrap-carousel.js"/>
{% endblock %}


{% block content %}

{% helper request %}

{% set featured_story = articles.shift() %}
{% set featured_images = featured_story.media.grab('type', 'image') %}
{% if not featured_images.length %}
	{% set secondary_story = articles.shift() %}
{% endif %}

{% set images = article.media.grab('type', 'image', true) %}

{% set video = article.media.grab('type', 'video', true) %}
{% set audio = article.media.grab('type', 'audio', true) %}
{% set slide = article.media.grab('type', 'soundSlide', true) %}
{% set interactives = article.media.grab('type', 'flash', true) %}
{% set pdfs = article.media.grab('type', 'pdf', true) %}



{% import "macros/article.tpl" as articleRender %}




<div class="row">
	<div class="span8">



		<div class="row-fluid">

			<!-- Top Stories -->
			<div class="row-fluid">
				<article class="row-fluid summarized-story">
					{% if featured_images.length %}
						<div class="span6">
							<div style="width:100%; background-color:#cfcfcf;">
							<a href="{{ featured_story.url }}"><img src="{{ featured_images[0].url }}" class="featured_story-img" /></a>
							</div>
							<figcaption class="bg">
								<span id="photocredit">
								  {% if featured_images[0].authors.length %}
								    {{ featured_images[0].authors.splat('name')|join(', ') }}
										  {% if featured_images[0].source %}
								  	 / {{ featured_images[0].source }}
									    {% endif %}
						  		{% endif %}
								</span>
								{{ featured_images[0].caption }}
								<hr class="spacer clearfix" />
							</figcaption>

						</div>
						<div class="span6">
							<h2><a href="{{ featured_story.url }}">{{ featured_story.headline }}</a></h2>

							<div class="aside mmb">
								{% if featured_story.authors.length %}
									<span class="byline">BY: {{ featured_story.authors.splat('name')|join(', ') }}</span>
								{% endif %}
								<span class="pull-right">
								{{ metaRender.dateLine(featured_story.modified) }}
								</span>
							</div>
							<div class="abstract"><p>{{ featured_story.abstract_formatted }} <a href="{{ featured_story.url }}">Read More</a></p></div>
						</div>
					{% else %}
						<div class="span6">
							<h2><a href="{{ featured_story.url }}">{{ featured_story.headline }}</a></h2>

							<div class="aside mmb">
								{% if featured_story.authors.length %}
									<span class="byline">BY: {{ featured_story.authors.splat('name')|join(', ') }}</span>
								{% endif %}
								<span class="pull-right">
								{{ metaRender.dateLine(featured_story.modified) }}
								</span>
							</div>
							<div class="abstract"><p>{{ featured_story.abstract_formatted }} <a href="{{ featured_story.url }}">Read More</a></p></div>
						</div>
						<div class="span6">
							<h2><a href="{{ secondary_story.url }}">{{ secondary_story.headline }}</a></h2>

							<div class="aside mmb">
								{% if secondary_story.authors.length %}
									<span class="byline">BY: {{ secondary_story.authors.splat('name')|join(', ') }}</span>
								{% endif %}
								<span class="pull-right">
								{{ metaRender.dateLine(secondary_story.modified) }}
								</span>
							</div>
							<div class="abstract"><p>{{ secondary_story.abstract_formatted }} <a href="{{ secondary_story.url }}">Read More</a></p></div>
						</div>
					{% endif %}
				</article>
			</div>
			<!-- End of Top Stories -->
		</div>

		
		<span><h1 style="display: inline;">More {% if section.slug == 'crime-blotter' %}Crime Blotter{% else %}{{section.slug}}{% endif %}</h1></span>

		<div class="row-fluid">
			{% for story in articles.shift(2) %}
				<div class="span6">
					{{ articleRender.topSidebar(story) }}
				</div>
			{% endfor %}
		</div>

		<div class="row-fluid">
			{% for story in articles.shift(2) %}
				<div class="span6">
					{{ articleRender.topSidebar(story) }}
				</div>
			{% endfor %}
		</div>
		
		{% if section.slug != 'opinion' and section.slug != 'crime-blotter' %}
		<div class="row-fluid">
			<div class="span12">
				<h1>Multimedia</h1>
					{% include 'gryphon/multimedia/mm_carousel.tpl' with ['tags':section.tags] %}
			</div>
		</div>
		{% endif %}


		<hr/>

		{% if section.slug == 'opinion' %}
			{% include "gryphon/section/modules/opinion.tpl" %}
		{% elseif section.slug == 'mix' %}
			{% include "gryphon/section/modules/mix.tpl" %}
		{% elseif section.slug == 'sports' %}
			{% include "gryphon/section/modules/sports.tpl" %}
		{% else %}
			{% include "gryphon/section/modules/news.tpl" %}
		{% endif %}
		
		

	</div>

	{% include "gryphon/main/sidebar/sidebar-standard.tpl" %}


</div>
{% endblock content %}
