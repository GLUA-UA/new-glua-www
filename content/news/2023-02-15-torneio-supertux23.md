---
layout: post
title: "Torneio de SuperTux 2023"
date: 2023-02-15
excerpt: "Detalhes e Inscrições para o torneio."
tags: [supertux, torneio, social, glua]
feature: /assets/img/posts/supertux23/st-banner.png
author: ["João Felisberto"," e ","André Alves"]
tutorial: false
comments: false
---

[st-masto]: {{ site.baseurl }}/assets/img/posts/supertux23/st-masto.png
[st-post]: {{ site.baseurl }}/assets/img/posts/supertux23/st-post.png
[st-pdf]: {{ site.baseurl }}/assets/img/posts/supertux23/st-poster.pdf
[st-poster]: {{ site.baseurl }}/assets/img/posts/supertux23/st-poster.png
[st-story]: {{ site.baseurl }}/assets/img/posts/supertux23/st-story.png
![Cartaz do evento com algumas das informações em baixo escritas][st-masto]

# Torneio de SuperTux 2023

No dia 27 de fevereiro às 18 horas iremos organizar a **segunda edição** do **torneio de SuperTux**.

Se este jogo fez parte da tua infância, vem matar saudades e participa no torneio!

## Detalhes do Evento

O torneio terá **4 fases**, apenas passando à seguinte os melhores da anterior.

Em cada fase, os concorrentes terão de passar níveis entre um inicial e um final, não importando o caminho.

Não são permitidos *bugs*, *glitches*, *hacks* ou quaisquer outros *exploits*.

Para mais informações, consultem o [regulamento](/assets/docs/Regulamento_do_Torneio_SuperTux.pdf){:target="_blank"}.

📍 **Anfiteatro IV do DETI**\
📆 **27 de fevereiro**\
🕖 **18:00** - Entrada no Anfiteatro e introdução ao torneio\
🕖 **18:15** - Início do torneio

<hr>
## Inscrição

Alternativamente pode-se inscrever [aqui](https://forms.gle/2kMSfS6GDygV42rC8){:target="_blank"}.

<style>
input + span {
  padding-right: 30px;
}

input:invalid + span::after {
  position: absolute;
  content: "✖";
  padding-left: 5px;
}

input:valid + span::after {
  position: absolute;
  content: "✓";
  padding-left: 5px;
}
</style>
<form class="form" action="https://docs.google.com/forms/u/0/d/e/1FAIpQLSdbgg8kkxNi_Y3XsPrD5pjIjF0h19ob1fARB7DRgYLg9VWl6A/formResponse">
  <div class="form-group">
    <label for="nome" class="col-form-label">Nome</label>
    <input name="entry.1525801019" type="text" id="nome" class="form-control" style="width:70%; display:block;" placeholder="Indique o seu nome" required/>
  </div>
  <div class="form-group">
    <label for="email">Email</label>
    <input name="entry.1849280727" type="text" id="email" class="form-control" style="width:70%; display:block;" placeholder="Indique o seu Email" required/> 
  </div>
  <div class="form-group">
    <label for="ies" class="col-form-label" >Instituição de Ensino</label>
    <input name="entry.364569669" type="text" id="ies" class="form-control" style="width:70%; display:block;" placeholder="Indique a sua Instituição de Ensino" required/>
  </div>
  <div class="form-group">
    <label for="curso" class="col-form-label">Curso</label>
    <input name="entry.1733088545" type="text" id="curso" class="form-control" style="width:70%; display:block;" placeholder="Indique o seu curso"/> 
  </div>
  <div class="form-group">
    <label for="ano" class="col-form-label" style="display:block;">Ano</label>
    <input name="entry.555402528" type="number" min="1" max="5" step="1" id="ano" class="form-control" style="width:70%;" placeholder="Indique o seu ano (1 a 5)"/><span class="validity"></span>
  </div>
  <input type="submit" class="btn btn-warning" value="Submeter" />
</form>

