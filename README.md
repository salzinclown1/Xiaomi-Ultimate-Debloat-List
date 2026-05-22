# Xiaomi Ultimate Debloat List

> Pare a Xiaomi de te espionar. Deixe seu Android mais rápido. Retome o controle.

---

## Por que isso existe?

A Xiaomi envia seus dispositivos com uma quantidade absurda de software pré-instalado que roda silenciosamente em segundo plano — coletando dados, enviando telemetria para servidores na China e exibindo anúncios. Além disso, os serviços do Facebook vêm embutidos a nível de sistema, te rastreando mesmo que você nunca tenha instalado o aplicativo.

Este script remove tudo isso.

Seus dados ficam no seu celular. Sua bateria dura mais. Seu celular para de trabalhar pra eles e começa a trabalhar pra você.

---

## O que é removido?

### Spyware & Telemetria

Pacotes comprovadamente responsáveis por coletar e transmitir seus dados para servidores externos:

| Pacote | Descrição |
|---|---|
| `com.miui.daemon` | Envia dados do dispositivo para servidores da Xiaomi na China¹ |
| `com.miui.analytics` | Analytics de uso do MIUI |
| `com.miui.misightservice` | Coleta de dados em segundo plano da Xiaomi |
| `com.miui.msa.global` | Sistema de anúncios e agregação de dados do MIUI |

> ¹ Pesquisa por [@fs0c131y](https://github.com/fs0c131y)

### Serviços do Facebook pré-instalados

Instalados pela Xiaomi a nível de sistema. Rastreiam o usuário mesmo sem conta no Facebook.

- `com.facebook.system`
- `com.facebook.appmanager`
- `com.facebook.services`

### Bloatware Geral

Apps redundantes da Xiaomi/MIUI, ferramentas de diagnóstico da MediaTek, serviços da Tencent e outros softwares que você nunca pediu.

### Apps do Google (opcional)

Comentados por padrão no script. Descomente o que quiser remover.

---

## Como usar

### Requisitos

- [ADB](https://developer.android.com/tools/adb) instalado no seu PC
- Depuração USB ativada no dispositivo (`Configurações > Opções do desenvolvedor`)
- Dispositivo conectado via USB

### Execute

```bash
git clone https://github.com/salzinclown1/Xiaomi-Ultimate-Debloat-List.git
cd Xiaomi-Ultimate-Debloat-List
chmod +x xiaomi-debloat.sh
./xiaomi-debloat.sh
```

### Restaurar um pacote (se algo quebrar)

```bash
adb shell pm install-existing <nome.do.pacote>
```

---

## É seguro?

O script utiliza `pm uninstall -k --user 0`, que desinstala os pacotes **apenas para o usuário atual** — sem apagar partições do sistema ou exigir root. Toda remoção é **totalmente reversível** com o comando de restauração acima.

Dito isso, sempre leia o script antes de executar. Entenda o que você está removendo.

---

## Testado em

- HyperOS 2.x (Global)

---

## Referências

- [Universal Android Debloater](https://github.com/0x192/universal-android-debloater)

---

## Licença

MIT
