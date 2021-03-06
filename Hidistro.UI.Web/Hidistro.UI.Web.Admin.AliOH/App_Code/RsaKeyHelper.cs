﻿namespace Hidistro.UI.Web.App_Code
{
    using System;
    using System.Diagnostics;
    using System.IO;

    public class RsaKeyHelper
    {
        public static string CreateRSAKeyFile(string generatorPath, string keyDirectory)
        {
            Process process = new Process();
            ProcessStartInfo info = new ProcessStartInfo {
                FileName = generatorPath,
                UseShellExecute = false,
                RedirectStandardInput = true,
                RedirectStandardOutput = true,
                Arguments = "\"" + keyDirectory + "\""
            };
            process.StartInfo = info;
            process.Start();
            process.WaitForExit();
            return GetRSAKeyContent(keyDirectory + "/rsa_public_key.pem", true);
        }

        public static string GetRSAKeyContent(string path, bool isPubKey)
        {
            string str = string.Empty;
            string str2 = isPubKey ? "PUBLIC KEY" : "RSA PRIVATE KEY";
            using (StreamReader reader = new StreamReader(path))
            {
                str = reader.ReadToEnd();
                reader.Close();
            }
            string str3 = string.Format(@"-----BEGIN {0}-----\n", str2);
            string str4 = string.Format("-----END {0}-----", str2);
            int startIndex = str.IndexOf(str3) + str3.Length;
            int index = str.IndexOf(str4, startIndex);
            return str.Substring(startIndex, index - startIndex).Replace("\r", "").Replace("\n", "");
        }
    }
}

