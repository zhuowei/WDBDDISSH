import Foundation
import Security

let cert = SecCertificateCreateWithData(
  nil, try! Data(contentsOf: URL(fileURLWithPath: "cert.der")) as CFData)
let secPolicy = SecPolicyCreateBasicX509()
var secTrust: SecTrust?
SecTrustCreateWithCertificates([cert, cert] as CFArray, secPolicy, &secTrust)
var error: CFError?
let result = SecTrustEvaluateWithError(secTrust!, &error)
print(result, error)
