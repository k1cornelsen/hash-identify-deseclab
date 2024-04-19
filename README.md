# hash-identify-deseclab
Script em Bash para execução do laboratório da Semana 08 - Hashes e Senhas Linux do curso Novo Pentest Profissional

Durante um pentest encontramos um github com o código que a aplicação usava para gerar o hash do sistema. O código fazia um md5 na string, em seguida um base64, em seguida um sha1.

Descubra a senha do hash gerado pelo sistema:
806825f0827b628e81620f0d83922fb2c52c7136

Dica: utilize a wordlist do john (password.lst)
Dica2: Crie um script para ler a wordlist e aplicar o algoritmo acima.



Para utilização

chmod +x hashscript.sh
./hashscript.sh 806825f0827b628e81620f0d83922fb2c52c7136



