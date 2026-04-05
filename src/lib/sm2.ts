export interface SM2Input {
	quality: number
	easiness: number
	interval: number
	repetitions: number
}

export interface SM2Output {
	easiness: number
	interval: number
	repetitions: number
	nextReview: string
}

export function sm2(input: SM2Input): SM2Output {
	const { quality, easiness, interval, repetitions } = input

	let newInterval = interval
	let newRepetitions = repetitions
	let newEasiness = easiness

	if (quality >= 3) {
		if (repetitions === 0) {
			newInterval = 1
		} else if (repetitions === 1) {
			newInterval = 6
		} else {
			newInterval = Math.round(interval * easiness)
		}
		newRepetitions = repetitions + 1
	} else {
		newRepetitions = 0
		newInterval = 1
	}

	newEasiness = Math.max(1.3, easiness + (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02)))

	const today = new Date()
	const nextDate = new Date(today)
	nextDate.setDate(today.getDate() + newInterval)
	const nextReview = nextDate.toISOString().split('T')[0]

	return {
		easiness: newEasiness,
		interval: newInterval,
		repetitions: newRepetitions,
		nextReview,
	}
}
