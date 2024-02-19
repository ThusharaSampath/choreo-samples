using System;
using System.Net;

namespace HelloWorldApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Console.WriteLine("Arguments length: " + args.Length);
            foreach (var arg in args)
            {
                Console.WriteLine("Command-line argument: " + arg);
            }
        }
    }
}