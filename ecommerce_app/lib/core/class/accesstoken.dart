import 'package:googleapis_auth/auth_io.dart';

class AccessTokenFirebase {
  static const String firebaseMessagingScope =
      "https://www.googleapis.com/auth/firebase.messaging";

  Future<String> getAccessToken() async {
    try {
      // Load your service account credentials from a secure source
      var client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson(
            // Retrieve the JSON credentials securely
            {
              "type": "service_account",
              "project_id": "ecommerce-31b11",
              "private_key_id": "31f995d128fe7591d255108af34cfeaa17406243",
              "private_key":
                  "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC8RDaFnc4onWHr\noR16iNYZlbBdrVIry9cYSGkQvmK0erB9GGxe9m7xbRbPJonTwhTOkRQphCTEwME6\nCmjFyfO7FyKn956IkZ2y7LJyrjzdszJrvPN2fJAg1CUwo9ILIrT//K0wRRWezP8J\nEaveNXMcQUgwJv9CRnmM6mTvuMq6410TWwQ4ahvtQ6zIotq5XkV50Nn5ZYzrGFqw\nzVLYJGqLZ5SRfAtlSfqQDfG2PTIhTpYEYkyp2X35c/LtRXYLqAlHTEBLbsRK8Hov\nN6tQfjqiKfLgVivkyN6EJUqUD/VA/QqvwEF+KATuIF9zx4fpAxyb2QK1Q546wK1V\nGFPxJsuVAgMBAAECggEACn2DizjykJVKbEJ/PcFrqqPKXsHmWv3h956rSg1NuzA9\n7s6CVV1Ga8nwFC1ZzzSYi7UOSkzsbpEuAyGq2mCJJfLhUbosuX/hqWNigxzd092l\nENdHuqGwtz+S7e2m6ctuifgGn3KuBHn4OQVkzf4s8pVZpCM8JHGAWt+BrdDebQDf\nKrF8FX/Z4c4R2CwMTD6ajx0jIK757ZfrCakMo6hANuFAU+MuCbt8NHZvvsUCmLkv\nSEM/ZHOr+L55WC1cJ3OGna8/mvH+rJBjbBzqQ2cy70zwcVcS8BubSGUbyDk0q/av\nIQt2I5GJqX8LPEh0i/To5uxFSkqYynIzxKJ1fajPKQKBgQDGY2b7YeW8W94o9Emc\nVxkT1z3+zZu1/xhWawJjiTxk+Gobl0RXjBOy/ePVB/Axv8T7WRBnXKpJYWbDvXRr\nVL0TZo+933N29EEhfXG/vHScj5Qgd6qRiZlTlplRAMltaAhRizfOmw+Yjf3r+2Kv\n/RmJNpY/b/xxZRT69CCoPLC6CQKBgQDy8FUksAjt+NZjcTrfnl+RB86Dw8PocV1w\nEY9BfW14+QKuQ4cVEgv1hMPMksRulay5vwjNVGaKNq6FYsRz3YO+/V2WMeTcU+3T\nucs4wd7LsUFq/J9QvCK0M4AChncIMeRmcJJAGFgUHO0RkMbKL/xflVbwBvtIT+n3\n98LtOctYLQKBgQDDXHW4DTKnpywB1nZ6n4aRdD+XoK+6rCcySpSCok03/Sy4WOCy\n+b0YYU6vpO6Sfw8imRU/RBBozKLfFL0FSOAcr73TM61HscZFjXurXZDT78vloRH1\n2bOEjeQS0ZyJwY2Xh2oAadAU4ZbwgJAxUCOKbJfOhp/opqrfafKS2ZkKyQKBgQDs\nNfXzaB4mlG6P3gaqayjssTSBNZWEqsV5M/mgab5Jg4SxwALV3+g03tQqUwIfq/R3\n3mFGlCvnc2eZVgFBzz5MM7oNUZH/ELQLy3jnRMnGMCE1T0/whh0QLYrn6apPE4PK\nfuYU4Baz57QyAhzndmTi4yfW1lL5aopJimPDmRA4OQKBgHc+o/MA5N9wydSz71Qt\nzyYGE4f2dS0+5/oDfAmcSbRvWjHUynsEKe77f+db9ViWxPwgCoae32kuE6u3V/YB\nqq5trri593LRCA2/70iRCiOlbebBaNFE26eqD7je5PXO40+0tYFZYPyagmtXQ+kj\nhlpXXGOLjV/eCVga73sEtPV3\n-----END PRIVATE KEY-----\n",
              "client_email":
                  "firebase-adminsdk-fvm85@ecommerce-31b11.iam.gserviceaccount.com",
              "client_id": "116018263503214396601",
              "auth_uri": "https://accounts.google.com/o/oauth2/auth",
              "token_uri": "https://oauth2.googleapis.com/token",
              "auth_provider_x509_cert_url":
                  "https://www.googleapis.com/oauth2/v1/certs",
              "client_x509_cert_url":
                  "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fvm85%40ecommerce-31b11.iam.gserviceaccount.com",
              "universe_domain": "googleapis.com"
            }),
        [firebaseMessagingScope],
      );

      // Extract the access token from the credentials
      final accessToken = client.credentials.accessToken.data;

      // Return the access token
      return accessToken;
    } catch (e) {
      // Handle errors appropriately
      throw Exception('Failed to get access token: $e');
    }
  }
}
