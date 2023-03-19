_Screen.Visible = .F.

On Key Label Alt+F4 Do Sair
On Shutdown Do Sair

Do Form frm_display
Read Events
On Shutdown

Procedure Sair
	On Shutdown
	Recall All
	Clear Events
	Close All
	Quit
Endproc

Procedure ExecutarSemRestricoes
	Lparameter lcComando, lcAcao, lcParams

	lcAcao = Iif(Empty(lcAcao), "Open", lcAcao)
	lcParams = Iif(Empty(lcParams), "", lcParams)

	Declare Integer ShellExecute ;
		IN SHELL32.Dll ;
		INTEGER nWinHandle, ;
		STRING cOperation, ;
		STRING cFileName, ;
		STRING cParameters, ;
		STRING cDirectory, ;
		INTEGER nShowWindow
	
	Declare Integer FindWindow ;
		IN WIN32API ;
		STRING cNull,String cWinName
	
	Return ShellExecute(FindWindow(0, _Screen.Caption), ;
		lcAcao, lcComando, ;
		lcParams, Sys(2023), 1)
Endproc
