USE CAUDALIMETRO

Select *
from PERSONAS P
INNER JOIN USUARIOS U ON P.PERSONA_ID = U.USUARIO_ID
WHERE U.ESTADO_REGISTRO = 1
AND P.ESTADO_REGISTRO = 1
AND U.ESTADO = 'Activo'