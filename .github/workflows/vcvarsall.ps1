# https://gitlab.kitware.com/cmake/cmake/-/blob/master/.gitlab/ci/vcvarsall.ps1

$erroractionpreference = "stop"

cmd /c "`"$env:VCVARSALL`" $env:VCVARSPLATFORM -vcvars_ver=$env:VCVARSVERSION & set" |
foreach {
    if ($_ -match "=") {
        $v = $_.split("=")
        [Environment]::SetEnvironmentVariable($v[0], $v[1])
    }
}
