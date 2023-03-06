# Critical Warning:
Este campo indica advertencias críticas para el estado del controlador. Cada bit corresponde a un tipo de advertencia crítica; se pueden configurar varios bits. Si un bit se borra a '0', entonces esa advertencia crítica no se aplica. Las advertencias críticas pueden generar una notificación de evento asincrónico al host. Los bits de este campo representan el estado asociado actual y no son persistentes.

Definición de bits
* 00: si se establece en '1', el espacio libre disponible ha caído por debajo del umbral.
* 01: si se establece en '1', entonces la temperatura está por encima del umbral de temperatura superior o por debajo del umbral de temperatura inferior.
* 02: si se establece en '1', la confiabilidad del subsistema NVM se ha degradado debido a errores significativos relacionados con los medios o cualquier * error interno que degrada la confiabilidad del subsistema NVM.
* 03: si se establece en '1', el medio se ha colocado en modo de solo lectura.
* 04: si se establece en '1', el dispositivo de copia de seguridad de la memoria volátil ha fallado. Este campo solo es válido si el controlador tiene una solución de respaldo de memoria volátil.
* 07:05: Reservado



# Composite Temperature

Contiene un valor correspondiente a una temperatura en grados Kelvin que representa la temperatura compuesta actual del controlador y los espacios de nombres asociados con ese controlador. La forma en que se calcula este valor es específica de la implementación y es posible que no represente la temperatura real de ningún punto físico en el subsistema NVM. El valor de este campo se puede utilizar para desencadenar un evento
asíncrono.

Los valores de umbral de temperatura compuesta de advertencia y sobrecalentamiento crítico se notifican mediante los campos WCTEMP y CCTEMP en la estructura de datos del controlador de identificación.


# Available Spare:
Contiene un porcentaje normalizado (0 a 100 %) de la capacidad disponible restante.


# Available Spare Threshold
Cuando el **Available Spare:** cae por debajo del umbral indicado en este campo, puede ocurrir que desencadene un evento asincrónico. El valor se indica como un porcentaje normalizado (0 a 100%).



# Percentage Used:
Porcentaje usado. Contiene una estimación específica del proveedor del porcentaje de vida útil del subsistema NVM utilizado en función del uso real y la predicción del fabricante de la vida útil de la NVM. Un valor de 100 indica que se ha   consumido la resistencia estimada de la NVM en el subsistema de NVM, pero es posible que no indique una falla del subsistema de NVM. Se permite que el valor supere los 100. Los porcentajes superiores a 254 se representarán como 255. Este valor se actualizará una vez por hora de encendido (cuando el controlador no esté en estado de suspensión).

Consulte el estándar JEDEC JESD218A para conocer las técnicas de medición de la duración y la resistencia de los dispositivos SSD.


# Data Units Read:
Contiene el número de unidades de datos de 512 bytes que el host ha leído del controlador; este valor no incluye metadatos. Este valor se informa en miles (es decir, un valor de 1 corresponde a 1000 unidades de 512 bytes  leídos) y se redondea hacia arriba. Cuando el tamaño de LBA es un valor distinto de 512 bytes, el controlador convertirá la  cantidad de datos leídos a unidades de 512 bytes.

Para el conjunto de comandos NVM, los bloques lógicos leídos como parte de las operaciones de comparación y lectura se incluirán en este valor.

# Data Units Written:
Contiene el número de unidades de datos de 512 bytes que el host ha escrito en el controlador; este valor no incluye metadatos. Este valor se informa en miles (es decir, un valor de 1 corresponde a 1000 unidades de 512
bytes escritos) y se redondea hacia arriba. Cuando el tamaño de LBA es un valor distinto de 512 bytes, el controlador convertirá
la cantidad de datos escritos a unidades de 512 bytes.
Para el conjunto de comandos NVM, los bloques lógicos escritos como parte de las operaciones de escritura se incluirán en
este valor. Los comandos de escritura incorregible no afectarán este valor


Host Read Commands


Host Write Commands:


Controller Busy Time:




Power Cycles



Unsafe Shutdowns:


Media and Data Integrity Errors:



Number of Error Information Log Entries: Contains the number of Error Information log entries over the
life of the controller.




Warning Composite Temperature Time:




Critical Composite Temperature Time:




Temperature Sensor 2:





