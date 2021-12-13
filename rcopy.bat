@echo off
::code by João Avila::
setlocal enabledelayedexpansion
set origem=C:\SivaServer\SivaFiles\Files_SivaNFe\Uninfe\
set destino=C:\SivaDisc\SivaServer\SivaFiles\Files_SivaNFe\Uninfe\
::set destino=C:\Temp\
set autorizados=\Prod\Enviado\Autorizados
set denegados=\Prod\Enviado\Denegados
for %%i in (*.txt) do (
    ::set file=%%~ni%%~xi
	set file=%%~fi
	set data=%%~ni
)
set count=0
for /f "tokens=*" %%x in (%file%) do (
	set /a count+=1
    set var[!count!]=%%x
	::echo %%x
	set cnpj=%%x
	
	::ativar linha abaixo para analisar todas as pastas dentro de autorizados / denegados
	::robocopy %origem%!cnpj!%autorizados% %destino%!cnpj!%autorizados% /MIR /FFT /Z /MT:3 /V /MAXAGE:%data%
	
	::ativar linhas abaixo para especificar a pasta de data no fim da linha
	robocopy %origem%!cnpj!%autorizados%\%data% %destino%!cnpj!%autorizados%\%data% /MIR /FFT /Z /MT:3 /V /MAXAGE:%data%
	robocopy %origem%!cnpj!%denegados%\%data% %destino%!cnpj!%denegados%\%data% /MIR /FFT /Z /MT:3 /V /maxage:%data%
)
