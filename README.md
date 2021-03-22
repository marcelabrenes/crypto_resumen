# Api para manejo de criptomonedas.

## Introducción

La invención del bitcoin por el señor (o grupo de personas) Satoshi Nakamoto en el año 2009 marcó un hito
en la historia de la economía y de la informática.

Poco a poco, esta criptomoneda ha ido aumentando su valor, dado que cada vez más gente la compra y esto propicia
que su valor aumente. El valor del dólar y las demás monedas FIAT está en la confianza que tienen las personas
en sus bancos centrales. En cambio el valor que tiene bitcoin radica en que las personas tengan confianza
en que las otras personas hagan uso de este activo digital como unidad para hacer intercambios comerciales.

Pero el bitcoin no solamente se ha mostrado como un fuerte contendiente al dólar y las demás monedas FIAT. La tecnología
que está detrás de bitcoin: la blockchain, ha servido para inspirar ideas en muchas personas, y estas ideas se han materializado
en lo que se denomina en la jerga cripto como `altcoins.`

El término `altcoin` proviene de "moneda alternativa". Son proyectos que se han realizados inspirados en la tecnología blockchain
detrás del bitcoin, y lo que buscan es mejorar los problemas de eficiencia que presenta el hermano mayor bitcoin.

La tecnología blockchain detrás de bitcoin es lo que se denomina comúnmente como blockchain de primera generación.
La blockchain que acompaña a ethereum se le llama blockchain de segunda generación, ya que permite incorporar los smart
contracts, o contratos inteligentes. Y la blockchain de tercera generación es la que respalda a Cardano, que ofrece
unas mejoras sustanciales a la eficiencia con que se va creando las transacciones en la red de Cardano. Cardano es
un proyecto que aún no está terminado

Existen cientos de altcoins distintas. Cada una tiene su gracia, pero ¡cuidado! hay algunas que son estafas.

Existen plataformas web y móvil llamadas exchange de cryptos. Estas plataformas cumplen el rol de banco de criptomonedas,
y además permiten al usuario transar criptomonedas como si uno estuviera en la bolsa de acciones. Uno puede colocar órdenes
de compra y venta de altcoins, uno puede ver gráficos de velas japonesas (o `candlesticks`, en inglés) para realizar
análisis técnicos de tendencias, entre muchas cosas más.

Existe una plataforma especial llamada (coingecko)[https://www.coingecko.com/en] que si bien no se trata de un exchange propiamente tal,
permite al usuario tomar solamente información sobre criptomonedas. Esta información se puede obtener tanto a través de su aplicación web
(el enlace es el anterior), como a través de su API. (Pinchando aquí puede ver la documentación completa de su API)[https://www.coingecko.com/en/api]

## Problema.

La API de coingecko es fantástica: uno puede obtener muchísima información de muchos características de una criptomoneda. El problema que tiene
es que muchas veces usted encontrará más información de la que necesita. Si bien esta información es muy útil para quien pretenda hacer
una aplicación compleja que necesite calcular varios parámetros de una criptomoneda, puede ser abrumadora la cantidad de información que
obtiene un principiante.

Ayudándose del comando `rails new <nombre de su aplicación> --api`, construya una API en Ruby on Rails que reúna las siguientes características:

### Tomar las altcoins en tendencia y guardar cada llamado a la API

Al hacer un GET a este endpoint: https://api.coingecko.com/api/v3/search/trending usted obtendrá la lista de las 7 altcoins en tendencias: Son las 7
altcoins más buscadas por los usuarios de coingecko en las últimas 24 horas. Pero nos entrega muy poco detalle sobre cada una de estas altcoins.

Invente un endpoint en su aplicación llamado `/crypto`, que al llamarse busque las 7 altcoins en coingecko de tendencia, y para cada una de ellas,
haga otro llamado a coingecko para obtener su último valor tanto en dólar como en su moneda local. Este último punto es opcional, porque SIEMPRE
el valor de la criptomoneda que está consultand se encontrará en USD. Pero si tiene suerte la encontrará en su moneda local (en el caso de Chile, CLP)

Para consultar los detalles de la criptomoneda en específico,  puede usar este endpoint: https://api.coingecko.com/api/v3/coins/:id
Debe reemplazar el `:id` por el id de cada una de las monedas obtenidas en el llamado a `trending`
Un ejemplo lo tiene aquí de como llamar a este último endpoint, para sacar los datos del bitcoin: https://api.coingecko.com/api/v3/coins/bitcoin

Por otra parte, haga un modelo que le permita ver cuantas veces alguien accedió a su endpoint
`/crypto`. Puede ser un poco "overkill" (matar una mosca con un tanque) hacer un scaffold para generar ese modelo. Pero aunque existan soluciones más simples,
hágalo para ver como le genera una API REST automáticamente.

PISTAS / HINT

PISTA: En el endpoint de coingecko para obtener el detalle de una criptomoneda, del JSON que recibe vaya a "market-data", luego a "current-price", y ahí
tendrá un hash que indica el valor en moneda FIAT de la criptomoneda. Si quiere saber el precio en dólar, debe buscar en ese hash la key "usd".



