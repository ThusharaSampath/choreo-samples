using System;
using System.Net;
using System.Threading;

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
            Console.WriteLine("Sleeping for 1 minute...");
            Thread.Sleep(TimeSpan.FromMinutes(6));
            Console.WriteLine("Resuming execution...");
        }
    }
}