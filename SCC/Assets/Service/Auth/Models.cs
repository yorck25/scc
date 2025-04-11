using System.Threading.Tasks;
using UnityEngine;

namespace Service.Auth
{
    public class AuthToken
    {
        private static AuthToken _instance;
        public static AuthToken Instance => _instance ??= new AuthToken();

        public string token =
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwbGF5ZXJJZCI6MSwiZXhwIjoxNzQ0Mzg2NDI0LCJpYXQiOjE3NDQzMDAwMjR9.mlfVkhSXZYZ9LPONcWTWGu7_J9bHb1D8NrMu7qDXVmQ";

        public override string ToString()
        {
            return "authToken: " + token;
        }
    }

    public class GameToken
    {
        private static GameToken _instance;
        public static GameToken Instance => _instance ??= new GameToken();

        public string token =
            "";

        public override string ToString()
        {
            return "gameToken: " + token;
        }
    }
}