export type PackageManager = 'npm' | 'yarn' | 'pnpm'

export interface ScaffoldOptions {
  directory: string
  sampleData: boolean
  start: boolean
  packageManager: PackageManager
  port: number
}
