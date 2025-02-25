---
layout: post
title: "Acesso à rede sem fios (Eduroam)"
thumbnail: 'thumbnails/tutorials/eduroam.svg'
date: 2013-04-08
updated: 2024-09-13
description: "Como configurar a rede eduroam na sua distribuição GNU/Linux."
tags: []
tutorial : true
comments: false
author: "Leandro Ricardo"
---

Neste tutorial pode encontrar informações de como configurar a rede eduroam na sua distribuição de GNU/Linux.


## Certificados

Para poder conectar-se à rede **eduroam**, vai ser preciso indicar um certificado de autenticação, cujo destino e ficheiro difere entre distribuições GNU/LINUX.
Assim sendo, pode confirmar na seguinte tabela qual é o caminho e ficheiro para as diferentes distribuições:

Para poder conectar-se à rede **eduroam** é necessário indicar um certificado de autentificação, cuja a sua localização difere para as diferentes distribuições GNU/LINUX. Assim sendo, pode confirmar na seguinte tabela qual é o caminho do ficheiro para as diferentes distribuições.

|            Distribuição             |        Ficheiro a selecionar         |
|:-----------------------------------:|:------------------------------------:|
| **Debian/Ubuntu/Gentoo/Arch Linux** | `/etc/ssl/certs/ca-certificates.crt` |
| **Fedora/RHEL**                     | `/etc/pki/tls/certs/ca-bundle.crt`   |
| **openSUSE/SLE**                    | `/etc/ssl/ca-bundle.pem`             |


________________________________

>Caso continue sem conexão, selecione o certificado **_DigiCert_Assured_ID_Root_CA.pem_**

## Gnome3

No canto superior direito deve selecionar o ícon de rede
![gnomeInternetIcon](img/gnome3-1.png)

Após selecionar a rede **eduroam**, deverá preencher os dados como na print, colocando o seu email e password da UA.

![gnomeInternetMenu](img/gnome3-2.png)

Depois de confirmar basta aguardar a validação de dados.

![gnomeInternetLoad](img/gnome3-3.png)

________________________________

<!--## KDE-->

<!--No canto inferior direito selecionar o ícon de rede. -->
<!--![kdeInternetIcon](img/kde-1.png)-->

<!--Após selecionar a rede **eduroam**, deverá preencher os dados como nas secções anteriores. (ex: [Unity](#unity))-->

<!--![kdeInternetMenu](img/kde-2.png)-->

<!--Despois de confirmar os dados inseridos, estes serão validados e terá a conexão com a rede **eduroam**.-->

<!--![kdeInternetLoad](img/kde-3.png)-->

<!--________________________________-->

## Linha de Comandos

{{<callout type="warning">}}
(**Atenção: Apenas para utilizadores com experiência...**)
{{</callout>}}

Caso prefira conectar-se à rede **eduroam** utilizando a consola siga os seguintes passos:

1 - Criar o ficheiro eduroam.conf e guardar o mesmo na home (~):

```bash
ctrl_interface=/var/run/wpa_supplicant

network={
        ssid="eduroam"
        key_mgmt=WPA-EAP
        eap=PEAP
        ca_cert="SUBSTITUIR"		# localização do ficheiro de certificados
        identity="UTILIZADOR@ua.pt"	# Substituir pelas vossas
        password="**********"		# credenciais de acesso
}
```
> Caso queira iniciar com a eduroam por padrão adicione a parte do network ao ficheiro /etc/wpa_supplicant/wpa_supplicant.conf (Os passos 3 e 4 passam a ser desnecessários)

2 - Alterar o texto ***SUBSTITUIR*** para o certificado de acordo com a sua distribuição

{{<callout type="info">}}
**Consultar a secção dos [certificados](#certificados)**
{{</callout>}}

```bash
ca_cert="SUBSTITUIR"
```

3 - De seguida, execute o seguinte comando

```bash
sudo pkill wpa_supplicant && sudo wpa_supplicant -i wlan0 -c /home/$USERNAME/eduroam.conf
```

4 - Por fim, será necessário fazer um pedido ao servidor de DHCP, também como súper-utilizador(___root___). Para tal, é preciso abrir outra consola e escrever:

```bash
sudo dhclient wlan0
```

Foi usado o cliente de DHCP `dhclient` (típico de Debian/Ubuntu/Fedora), mas poderia ser usado qualquer outro à escolha, por exemplo, o `dhcpcd` (típico de ArchLinux/Gentoo).

> Caso tenha problemas de "_disconnects_", ou problemas em obter um endereço IP, na distribuição Arch Linux, adicione a seguinte linha na secção _main_ do ficheiro _NetoworkManager.conf_ que se encontra em */etc/NetoworkManager/NetoworkManager.conf*
```bash
DHCP = dhclient
```

> Caso não queira abrir outra consola, pode-se executar o _wpa_supplicant_ em segundo plano usando:
~~~bash
sudo wpa_supplicant -i wlan0 -c/home/$USERNAME/eduroam.conf -B
~~~

Pronto, tem acesso à rede eduroam!
