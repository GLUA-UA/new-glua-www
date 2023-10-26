---
layout: post
title: "Acesso à rede sem fios (Eduroam)"
date: 2013-04-8
updated: 2018-07-25
excerpt: "Como configurar a rede eduroam na sua distribuição GNU/Linux."
tags: []
tutorial : true
comments: false
author: "Leandro Ricardo"
unity: 
 - /img/tutorials/eduroam/unity-1.png
 - /img/tutorials/eduroam/unity-2.png
 - /img/tutorials/eduroam/unity-3.png
 - /img/tutorials/eduroam/unity-4.png
gnome:
 - /img/tutorials/eduroam/gnome3-1.png
 - /img/tutorials/eduroam/gnome3-2.png
 - /img/tutorials/eduroam/gnome3-3.png
kde:
 - /img/tutorials/eduroam/kde-1.png
 - /img/tutorials/eduroam/kde-2.png
 - /img/tutorials/eduroam/kde-3.png
---

Neste tutorial pode encontrar informações de como configurar a rede eduroam na sua distribuição de GNU/Linux.


## Certificados

Para poder conectar-se a rede **eduroam** vai ser preciso indicar um certificado de autentificação, cujo o seu destino e ficheiro pode diferir para as diferentes distribuições GNU/LINUX. Assim sendo pode confirmar na seguinte tabela qual é o caminho e ficheiro para as diferentes distribuições:

Para poder conectar-se à rede **eduroam** é necessário indicar um certificado de autentificação, cuja a sua localização difere para as diferentes distribuições GNU/LINUX. Assim sendo, pode confirmar na seguinte tabela qual é o caminho do ficheiro para as diferentes distribuições.

|            Distribuição             |                  Ficheiro a selecionar                   |
|:-----------------------------------:|:--------------------------------------------------------:|
| **Debian/Ubuntu/Gentoo/Arch Linux** | **CA Certificate**: _/etc/ssl/certs/ca-certificates.crt_ |
| **Fedora/RHEL**                     | **CA Certificate**: _/etc/pki/tls/certs/ca-bundle.crt_   |
| **openSUSE/SLE**                    | **CA Certificate**: _/etc/ssl/ca-bundle.pem_             |


________________________________

>Caso continue sem conexão, selecione o certificado **_DigiCert_Assured_ID_Root_CA.pem_**

## Unity

No canto superior direito deve selecionar o ícone de rede ![ubuntuInternetIcon](/img/tutorials/eduroam/unity-1.png)
De seguida preencher os campos com os seguintes dados:

Campo                   |Valor
:---------------------: |:--------------------:
Wireless Security       | WPA&WPA2 Enterprise
Autentication           | Protected EAP (PEAP)
Anonymous Identity      |                     
CA certificate          | [Ver na tabela dos Certificados](#certificados)  
PEAP version            | Version 0           
Inner authentication    | MSCHAPv2            
Username                | mail@ua.pt          
Password                | *****

![ubuntuInternetMenu](/img/tutorials/eduroam/unity-2.png)

Depois de preencher todos os campos, conforme foi referido anteriormente, basta proceder a conexão e esperar
![ubuntuInternetLoad](/img/tutorials/eduroam/unity-3.png)

Após os dados serem validados irá receber a seguinte mensagem de ligação concluída com sucesso:
![ubuntuInternetLoad2](/img/tutorials/eduroam/unity-4.png)

________________________________

## Gnome3

No canto superior direito, como no [Unity](#unity), deve selecionar o ícone de rede 
![gnomeInternetIcon](/img/tutorials/eduroam/gnome3-1.png)

Após selecionar a rede **eduroam** deverá preencher os dados como na secção do [Unity](#unity).

![gnomeInternetMenu](/img/tutorials/eduroam/gnome3-2.png)

Depois de confirmar basta aguardar a validação de dados.

![gnomeInternetLoad](/img/tutorials/eduroam/gnome3-3.png)

________________________________

## KDE

No canto inferior direito selecionar o ícone de rede. 
![kdeInternetIcon](/img/tutorials/eduroam/kde-1.png)

Após selecionar a rede **eduroam** deverá preencher os dados como nas secções anteriores. (ex: [Unity](#unity))

![kdeInternetMenu](/img/tutorials/eduroam/kde-2.png)

Despois de confirmar os dados inseridos os dados serão validados e terá a conexão com a rede **eduroam**.

![kdeInternetLoad](/img/tutorials/eduroam/kde-3.png)

________________________________

## Linha de Comandos

<!--TODO: Use a warning-->
(**Atenção: Apenas para utilizadores com experiência...**)

Caso prefira conectar-se a rede **eduroam** utilizando a consola siga os seguintes passos:

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
>caso queira iniciar com a eduroam por padrão adicione a parte do network ao ficheiro /etc/wpa_supplicant/wpa_supplicant.conf (Os passos 3 e 4 passam a ser desnecessários)

2 - Alterar o texto ***SUBSTITUIR*** para o certificado de acordo com a sua distribuição

<!--TODO: Use a warning-->
**Consultar a secção dos [certificados](#certificados)**

```bash
ca_cert="SUBSTITUIR"
```

3 - De seguida, execute o seguinte comando

```bash
sudo pkill wpa_supplicant && sudo wpa_supplicant -i wlan0 -c /home/$USERNAME/eduroam.conf
```

4 - Por fim será necessário fazer um pedido ao servidor de DHCP também como súper-utilizador(___root___). Para tal, abrir outra consola e escrever:

```bash
sudo dhclient wlan0
```

Foi usado o cliente de DHCP dhclient (típico de Debian/Ubuntu/Fedora), mas poderia ser usado qualquer outro à escolha, por exemplo, o dhcpcd (típico de ArchLinux/Gentoo).

>Caso tenha problemas de "_disconnects_", ou problemas de obter um endereço IP, na distribuição ArchLinux adicione a seguinte linha na secção _main_ do ficheiro _NetoworkManager.conf_ que se encontra em */etc/NetoworkManager/NetoworkManager.conf*
```bash
DHCP = dhclient
```

>caso não se deseje abrir outra consola, pode-se executar o _wpa_supplicant_ em segundo plano usando:
~~~bash
sudo wpa_supplicant -i wlan0 -c/home/$USERNAME/eduroam.conf -B
~~~

Pronto, tem a sua distribuição configurada!
