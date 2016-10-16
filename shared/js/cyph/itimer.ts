/**
 * Represents a countdown timer.
 * @interface
 */
export interface ITimer {
	/** Human-readable string indicating remaining time. */
	timestamp: string;

	/**
	 * Extends the countdown duration.
	 * @param milliseconds
	 */
	addTime (milliseconds: number) : void;

	/**
	 * Initiates countdown.
	 * @returns Promise that resolves when countdown finishes or is stopped.
	 */
	start () : Promise<void>;

	/** Stops countdown. */
	stop () : void;
}
