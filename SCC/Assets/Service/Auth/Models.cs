using System.Threading.Tasks;
using UnityEngine;

namespace Service.Auth
{
    public class AuthToken
    {
        private static AuthToken _instance;
        public static AuthToken Instance => _instance ??= new AuthToken();
        public string token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwbGF5ZXJJZCI6MiwiZXhwIjoxNzQ0MDIzNTc1LCJpYXQiOjE3NDM5MzcxNzV9.DKc9bi3dJb-ccDrFompB3zjo3nhp0eOr9pAWlY4pMJ8";
        public int? userId;

        public override string ToString()
        {
            return "authToken: " + token;
        }
    }

    public class GameToken
    {
        private static GameToken _instance;
        public static GameToken Instance => _instance ??= new GameToken();
        public string token = "";

        public override string ToString()
        {
            return "gameToken: " + token;
        }
    }
}