

function getNamespace() {
   $currentContext = kubectl config get-contexts  $(kubectl config current-context) --no-headers
   $index = $currentContext.LastIndexOf(' ');
   $namespace = $currentContext.Substring($index).Trim();
   if($namespace.Lenght -ne 0) {
      $namespace = '**NO NAMESPACE**'
   }
   return  $namespace
}

function isKubectlInstalled {
   if (Get-Command "kubectl.exe" -ErrorAction SilentlyContinue)  {
      return 1;
   }
   else {
      return 0;
   }
}

function getCurrentContext() {
   return kubectl config current-context
}
