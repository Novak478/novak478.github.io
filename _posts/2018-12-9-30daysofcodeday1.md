---
title: "30 days of code -- Day 1"
layout: post
date: 2018-12-09 00:05
image: http://www.crossfitlando.com/wp-content/uploads/2018/01/Day-1.jpg
headerImage: true
projects: true
tag:
- programming
- tech
- stopignoring.me
- 30 days of code
category: project
author: zacknovak
description: 30 days of code -- Day 1
# jemoji: '<img class="emoji" title=":ramen:" alt=":ramen:" src="https://assets.github.com/images/icons/emoji/unicode/1f35c.png" height="20" width="20" align="absmiddle">'
---

## Summary:

This update is meant to cover what I did for day 1 of my 30 days of code.

Total changes:

- Restructured program to match Corey's structure 
- Changed main css file
- changed template / extended layout html file
- Created login and registration forms

---

## Day 1

So for day 1, I followed along Corey Schafer's Flask Tutorial - Part 3 and restructured my web application to match Corey's structure for simplicity (move files here, rename, etc), I changed my main css file, modified my extended layout.html file, and finally created login and registration forms! Highly recommend Corey's videos on Python. They're some of the best Python tutorials out there.

<iframe width="560" height="315" src="https://www.youtube.com/embed/UIJKdCIEXUQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

It went over user input and forms such as login and registration forms. Highly recommend Mr. Schafer's tutorials. 

## Login Form
![Login Form](https://github.com/Novak478/novak478.github.io/blob/master/assets/images/loginform.PNG?raw=true)

{% highlight html %}

{% extends "layout.html" %}
{% block content %}
    <div class="content-section">
        <form method="POST" action="">
            {{ form.hidden_tag() }}
            <fieldset class="form-group">
                <legend class="border-bottom mb-4">Log In</legend>
                <div class="form-group">
                    {{ form.email.label(class="form-control-label") }}
                    {% if form.email.errors %}
                        {{ form.email(class="form-control form-control-lg is-invalid") }}
                        <div class="invalid-feedback">
                            {% for error in form.email.errors %}
                                <span>{{ error }}</span>
                            {% endfor %}
                        </div>
                    {% else %}
                        {{ form.email(class="form-control form-control-lg") }}
                    {% endif %}
                </div>
                <div class="form-group">
                    {{ form.password.label(class="form-control-label") }}
                    {% if form.password.errors %}
                        {{ form.password(class="form-control form-control-lg is-invalid") }}
                        <div class="invalid-feedback">
                            {% for error in form.password.errors %}
                                <span>{{ error }}</span>
                            {% endfor %}
                        </div>
                    {% else %}
                        {{ form.password(class="form-control form-control-lg") }}
                    {% endif %}
                </div>
                <div class="form-check">
                    {{ form.remember(class="form-check-input") }}
                    {{ form.remember.label(class="form-check-label") }}
                </div>
            </fieldset>
            <div class="form-group">
                {{ form.submit(class="btn btn-outline-info") }}
            </div>
            <small class="text-muted ml-2">
                <a href="#">Forgot Password?</a>
            </small>
        </form>
    </div>
    <div class="border-top pt-3">
        <small class="text-muted">
            Need An Account? <a class="ml-2" href="{{ url_for('register') }}">Sign Up Now</a>
        </small>
    </div>
{% endblock content %}

{% endhighlight %}

## Registration Form
![Registration Form](https://github.com/Novak478/novak478.github.io/blob/master/assets/images/registrationform.PNG?raw=true)

{% highlight html %}

{% extends "layout.html" %}
{% block content %}
    <div class="content-section">
        <form method="POST" action="">
            {{ form.hidden_tag() }}
            <fieldset class="form-group">
                <legend class="border-bottom mb-4">Join Today</legend>
                <div class="form-group">
                    {{ form.username.label(class="form-control-label") }}

                    {% if form.username.errors %}
                        {{ form.username(class="form-control form-control-lg is-invalid") }}
                        <div class="invalid-feedback">
                            {% for error in form.username.errors %}
                                <span>{{ error }}</span>
                            {% endfor %}
                        </div>
                    {% else %}
                        {{ form.username(class="form-control form-control-lg") }}
                    {% endif %}
                </div>
                <div class="form-group">
                    {{ form.email.label(class="form-control-label") }}
                    {% if form.email.errors %}
                        {{ form.email(class="form-control form-control-lg is-invalid") }}
                        <div class="invalid-feedback">
                            {% for error in form.email.errors %}
                                <span>{{ error }}</span>
                            {% endfor %}
                        </div>
                    {% else %}
                        {{ form.email(class="form-control form-control-lg") }}
                    {% endif %}
                </div>
                <div class="form-group">
                        {{ form.phone.label(class="form-control-label") }}
                        {% if form.phone.errors %}
                            {{ form.phone(class="form-control form-control-lg is-invalid") }}
                            <div class="invalid-feedback">
                                {% for error in form.phone.errors %}
                                    <span>{{ error }}</span>
                                {% endfor %}
                            </div>
                        {% else %}
                            {{ form.phone(class="form-control form-control-lg") }}
                        {% endif %}
                    </div>
                <div class="form-group">
                    {{ form.password.label(class="form-control-label") }}
                    {% if form.password.errors %}
                        {{ form.password(class="form-control form-control-lg is-invalid") }}
                        <div class="invalid-feedback">
                            {% for error in form.password.errors %}
                                <span>{{ error }}</span>
                            {% endfor %}
                        </div>
                    {% else %}
                        {{ form.password(class="form-control form-control-lg") }}
                    {% endif %}
                </div>
                <div class="form-group">
                    {{ form.confirm_password.label(class="form-control-label") }}
                    {% if form.confirm_password.errors %}
                        {{ form.confirm_password(class="form-control form-control-lg is-invalid") }}
                        <div class="invalid-feedback">
                            {% for error in form.confirm_password.errors %}
                                <span>{{ error }}</span>
                            {% endfor %}
                        </div>
                    {% else %}
                        {{ form.confirm_password(class="form-control form-control-lg") }}
                    {% endif %}
                </div>
            </fieldset>
            <div class="form-group">
                {{ form.submit(class="btn btn-outline-info") }}
            </div>
        </form>
    </div>
    <div class="border-top pt-3">
        <small class="text-muted">
            Already Have An Account? <a class="ml-2" href="{{ url_for('login') }}">Sign In</a>
        </small>
    </div>
{% endblock content %}

{% endhighlight %}
--- 

## Follow my project on github here!
![Stop Ignoring Me](https://github.com/Novak478/stopignoringme)
---

[1]: http://daringfireball.net/projects/markdown/
[2]: http://www.fileformat.info/info/unicode/char/2163/index.htm
[3]: http://www.markitdown.net/
[4]: http://daringfireball.net/projects/markdown/basics
[5]: http://daringfireball.net/projects/markdown/syntax
[6]: http://kune.fr/wp-content/uploads/2013/10/ghost-blog.jpg
