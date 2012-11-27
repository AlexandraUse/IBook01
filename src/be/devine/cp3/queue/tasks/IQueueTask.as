package be.devine.cp3.queue.tasks
{
import flash.events.IEventDispatcher;

public interface IQueueTask extends IEventDispatcher
	{
		function start():void;
	}
}