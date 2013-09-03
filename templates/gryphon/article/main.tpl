{#gryphon/article/main.tpl#}

{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ article.headline }}{% endblock %}

{% block description %}{{ article.abstract_formatted|striptags }}{% endblock %}

{% block activeNav %}{{ active }}{% endblock %}

{% block styles %}
{% endblock %}

{% block scripts %}
{% endblock %}

{% block links %}
<link rel="canonical" type="text/html" href="{{ article.url }}" />
<link rel="alternate shorter" type="text/html" href="{{ shortUrl }}" />
{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}
{% import "macros/article.tpl" as articleRender %}
{% import "macros/render.tpl" as render %}
{% import "macros/disqus.tpl" as disqus %}

{% set mugShots = article.media.grab('meta', 'mugshot', true) %}
{% set gallerykeys = article.media.grab('meta', 'gallery key', true) %}
{% set images = article.media.grab('type', 'image', true) %}

{% set video = article.media.grab('type', 'video', true) %}
{% set audio = article.media.grab('type', 'audio', true) %}
{% set slides = article.media.grab('type', 'soundSlide', true) %}
{% set interactives = article.media.grab('type', 'flash', true) %}
{% set pdfs = article.media.grab('type', 'pdf', true) %}

{% set sections = article.sections %}


<!-- MAIN CONTENT -->
<div class="row">
	<div class="span8">

		<article class="complete-story">

			{% if commentHelper.userHasSession() %}
				<a href="{{ article.getEditURL() }}" class="btn btn-danger" target="_gedit">EDIT THIS</a>
				<hr class="spacer" />

			{% endif %}
			<h2>{{ article.headline }}</h2>

			<hr class="spacer" />

			{% if article.subhead %}
				<h2>{{ article.subhead }}</h2>
				<hr class="spacer" />
			{% endif %}

			<!-- AUTHOR BI-LINE -->

			<aside>
				{% if article.authors.length %}
					{% set author = article.authors.shift() %}
						by <a href="{{ author.url }}">{{ author.name }}</a>
						{% for author in article.authors %}
							and <a href="{{ author.url }}">{{ author.name }}</a>
						{% endfor %}
				{% endif %}
				<span id="publish">
				| Published {{ article.created|timeSince }}


				{% if article.created != article.modified %}
   					| Updated {{ article.modified|timeSince }}
				{% endif %}
				</span>
				<hr class="spacer" />
			</aside>
			<!-- Only FEATURE PHOTO -->
			<!-- FEATURE PHOTO -->

			<div>
				{% if images.length %}
					{% set domPhoto = images.shift() %}
					<a href="{{ domPhoto.url }}" class="fancybox-single main-photo" rel="article_{{ article.uid }}">
							<img src="{{ domPhoto.urlOriginal }}" alt="{{ domPhoto.base_name }}" />
					</a>

					<figcaption>
						{% if domPhoto.authors.length %}
							<div class="row-fluid">
								<div class="span12">
									<span id="photocredit" class="pull-right">
										{% set credit = domPhoto.authors.shift() %}
											by <a href="{{ credit.url }}">{{ credit.name }}</a>
											{% for credit in domPhoto.authors %}
												and <a href="{{credit.url}}">{{credit.name}}</a>
											{% endfor %}
										
										{% if domPhoto.source %}
											/ {{ domPhoto.source }}
										{% endif %}
									</span>
								</div>
							</div>
						{% endif %}
						{{ domPhoto.caption_formatted }}
					</figcaption>
				{% endif %}
			</div>

			<hr class="double spacer" />

			<ul class="share unstyled">
				<li><a href="http://www.facebook.com/sharer.php?u={{ article.url }}"><img src="{{ 'assets/dist/images/facebook.png'|asset}}"/></a></li>
				<li><a class="socialite twitter-share" href="http://twitter.com/share" data-url="{{ article.url }}"><img src="{{ 'assets/dist/images/twitter.png'|asset}}"/></a></li>
				<li><a href="#" onclick="window.print();return false;"><img src="{{ 'assets/dist/images/printer.png'|asset}}"/></a></li>
				<li><a href="mailto:?subject=Daily%20Gamecock:%20{{ article.headline }}&body=Hi%20there.%20%20Check%20out%20this%20article%20from%20The%20Daily%20Gamecock:%20{{ article.url }}" class="mail"><img src="{{ 'assets/dist/images/mail.png'|asset}}"/></a></li>
				<li><a href="#comments"><img src="{{ 'assets/dist/images/comments.png'|asset}}"/></a></li>
			</ul>


			{% macro countlink(item) %}
			<a href="{{ item.url }}#disqus_thread" data-disqus-identifier="{{ item.uuid }}">{{ item.name }}</a>
			{% endmacro %}

			<hr class="spacer" />
			<hr class="hairline clearfix" />

			{% if mugShots.length %}
				{% for mug in mugShots %}
					<div class="pull-left">
						<div class="mugshots">
							<img src="{{ mug.urlPreview }}" alt="{{ mug.caption }}" />
							{{ mug.caption_formatted }}
						</div>
					</div>
				{% endfor %}
			{% endif %}

			<span id="first-paragraph">
				{{ article.copy_formatted|extract(1) }}
			</span>
			{{ article.copy_formatted|extract(2,1) }}

			{% if article.infobox or pdfs.length %}
			<div class="info-box bg pull-right">
				<div class="highlight">
					{% if article.infobox %}
						{{ article.infobox_formatted }}
					{% endif %}
					{% if pdfs.length %}
						{% if article.infobox %}
							<hr class="spacer" />
						{% endif %}

						{% if pdfs.length %}
							<h5>Related Documents:</h5>
							<ul>
								{% for pdf in pdfs %}
									<li><a href="{{ pdf.urlOriginal }}"><i class="icon-book"></i> {{ pdf.title }}</a> - PDF</li>
								{% endfor %}
							</ul>
						{% endif %}
					{% endif %}
				</div>
			</div>
			{% endif %}

			{% if images.length or gallery.length or video.length or sound.length or pdfs.length or flash.length or domPhoto.gallery %}
				<div class="integrated-media-left">
					{% if domPhoto and domPhoto.gallery %}
						<div class="gallery">
							<img src="{{ domPhoto.urlPreview }}" alt="{{ domPhoto.base_name }}" class="preview" />
							<a href="{{ domPhoto.gallery.urlDefault }}" class="gall_link">View Full Gallery</a>
							<figcaption><i class="icon-th"></i> {{ domPhoto.gallery.title }}</figcaption>
						</div>
					{% endif %}

					{% for image in images %}
						{% if image.gallery %}
							<div class="gallery">
								<img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" class="preview" />
								<a href="{{ image.gallery.urlDefault }}" class="gall_link">View Full Gallery</a>
								<figcaption><i class="icon-th"></i> {{ image.gallery.title }}</figcaption>
							</div>
						{% else %}
							<div class="image">
								<a href="{{ image.url }}" class="fancybox-single" rel="article_{{ article.uid }}"><img src="{{ image.urlPreview }}"
								title="![CDATA[{{ image.caption }}]]"alt="{{ image.base_name }}" /></a>
								<figcaption><i class="icon-camera"></i> {{ image.caption }}</figcaption>
							</div>
						{% endif %}
					{% endfor %}

					{% for gallery in galleries %}

						<div class="gallery">
							<img src="{{ gallery.urlPreview }}" alt="{{ gallery.base_name }}" class="preview" />
							<a href="{{ gallery.gallery.urlDefault }}">View Full Gallery</a>
							<figcaption><i class="icon-th"></i> {{ gallery.gallery.title }}</figcaption>
						</div>

					{% endfor %}



					{% for video in videos %}

						<div class="video">
							<a href="{{ ('media/'~video.uid)|url }}" class="fancybox.ajax"><img src="{{ video.urlPreview }}" alt="{{ video.base_name }}" class="preview" /></a>
								<p>Video: {{ video.title|clip() }}</p>
						</div>

					{% endfor %}

					{% for item in flash %}

						{% if item.meta['flashembed'] %}
							<div class="flash">
								<a href="{{ item.urlDefault }}"><img src="{{ item.urlPreview }}" alt="{{ item.base_name }}" class="preview" /></a>
									<p>Interactive: {{ item.title|clip() }}</p>
							</div>

						{% endif %}

					{% endfor %}

					{% for sound in sounds %}

						<div class="audio">
							<div class="box">
							<i class="icon-volume-up"></i> {{ sound.title }}
							<audio src="{{ sound.urlOriginal }}" preload="auto" />
							</div>
						</div>

					{% endfor %}
				</div>
			{% endif %}

			{% if article.pull_quote.length %}
				<div class="pull-quote">
					{{ article.pull_quote }}
				</div>
			{% endif %}

			{{ article.copy_formatted|extract(null, 3) }}

			<hr class="hairline clearfix" />
			<ul class="share unstyled">
				<li><a href="http://www.facebook.com/sharer.php?u={{ article.url }}"><img src="{{ 'assets/dist/images/facebook.png'|asset}}"/></a></li>
				<li><a class="socialite twitter-share" href="http://twitter.com/share" data-url="{{ article.url }}"><img src="{{ 'assets/dist/images/twitter.png'|asset}}"/></a></li>
				<li><a href="#" onclick="window.print();return false;"><img src="{{ 'assets/dist/images/printer.png'|asset}}"/></a></li>
				<li><a href="mailto:?subject=Daily%20Gamecock:%20{{ article.headline }}&body=Hi%20there.%20%20Check%20out%20this%20article%20from%20The%20Daily%20Gamecock:%20{{ article.url }}" class="mail"><img src="{{ 'assets/dist/images/mail.png'|asset}}"/></a></li>
				<li><a href="#comments"><img src="{{ 'assets/dist/images/comments.png'|asset}}"/></a></li>
			</ul>


			<hr class="hairline clearfix" />

			<div class="row-fluid clearfix">
				<div class="span12">
					<div id="comments">
						{{ disqus.list(article) }}
					</div>
				</div>
			</div>

			<hr class="double spacer" />

			<div class="related-stories">
				<div class="row-fluid">
					<div class="span12">
						<h1>RELATED STORIES</h1>
						<div class="arrow-down"></div>
						<hr class="hairline clearfix" />
					</div>
				</div>
				<div class="row-fluid">
					{% set related = article.getRelated() %}
					<div class="span12">
						{% for item in related.shift(3) %}
							<div class="related clearfix">
								{% if item.media.length %}
									{% set img = item.media.grab('type', 'image')[0] %}
									<span id="related-image">
										<a href="{{ item.url }}"><img src="{{ img.urlThumbnail }}" /></a>
									</span>
								{% endif %}
								<h3><a href="{{ item.url }}">{{ item.headline }}</a></h3>
								<aside>
									{% if item.authors.length %}
										{% set author = item.authors.shift() %}
											by <a href="{{ author.url }}">{{ author.name }}</a>
											{% for author in item.authors %}
												and <a href="{{ author.url }}">{{ author.name }}</a>
											{% endfor %} |
									{% endif %}
									<span id="publish">
										 Published {{ item.created|timeSince }}
									</span>
								</aside>
							<hr class="hairline clearfix" />
							</div>
						{% endfor %}
					</div>
				</div>
			</div>
		</article>
	</div>
	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}
</div>
{% endblock content %}
