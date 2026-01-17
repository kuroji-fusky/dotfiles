package main

type ProcessTriggerAction string

const (
	TriggerActionAll ProcessTriggerAction = "all"
	TriggerActionAny ProcessTriggerAction = "any"
)

type SubprocessActions struct {
	LaunchExec       string `json:"launchExec,omitempty"`
	TerminateProcess any    `json:"terminateProcess,omitempty"`
}

type Actions struct {
	OnlyActive     *SubprocessActions `json:"onlyActive,omitempty"`
	OnProcessExit  *SubprocessActions `json:"onProcessExit,omitempty"`
	OnProcessStart *SubprocessActions `json:"onProcessStart,omitempty"`
}

type ConfigSchema struct {
	Name   string `json:"name,omitempty"`
	Config []struct {
		Name          string               `json:"name,omitempty"`
		Executable    any                  `json:"executable"`
		TriggerAction ProcessTriggerAction `json:"triggerAction,omitempty"`
		Actions       Actions              `json:"actions"`
		Overrides     []struct {
			Executable    any                  `json:"executable"`
			TriggerAction ProcessTriggerAction `json:"triggerAction,omitempty"`
			Actions       Actions              `json:"actions"`
		} `json:"overrides,omitempty"`
	} `json:"config"`
}
