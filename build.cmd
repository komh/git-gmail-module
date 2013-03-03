/**
 *  Build script for git-gmail-modue
 *  gcc v3.3.5 CSD 5 and perl v5.10.0 are required
 */
parse arg sMakeCmd

sSubDirs = 'Authen-SASL-2.16',
           'Net-SSLeay-1.52',
           'Net-IDN-Encode-2.003',
           'IO-Socket-SSL-1.84',
           'Net-SMTP-SSL-1.01'

do while sSubDirs \= ''
    parse value sSubDirs with sDir sSubDirs

    'cd' sDir

    'perl Makefile.PL'
    if rc \= 0 then
        leave

    'call gmake.cmd' sMakeCmd
    if rc \= 0 then
        leave

    'cd ..'
end

if rc \= 0 then
    say 'Error ocrrus on building, rc = ' || rc

exit rc
